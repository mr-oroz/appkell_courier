import 'dart:async';
import 'dart:convert';

import 'package:appkel_for_courier_flutter/providers/dependencies.dart';
import 'package:intl/intl.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../config/config.dart';
import '../data/models/api_reponse.dart';
import '../data/models/order_item_update_model.dart';
import '../data/models/order_model.dart';
import '../helpers/io_socket.helper.dart';

part 'my_order_providers.g.dart';

@riverpod
class MyOrderList extends _$MyOrderList {
  final socketHelper = WebSocketHelper('${Constants.wsBaseUrl}orders_list/');

  @override
  Future<List<OrderModel>> build() async {
    await socketHelper.connect();

    socketHelper.send(
      jsonEncode(
        {
          "type": "my_orders",
        },
      ),
    );
    socketHelper.stream().listen((event) {
      var map = jsonDecode(event);
      print(map);
      if (map is List) {
        state = AsyncValue.data(
          List.from(
            map.map(
              (e) => OrderModel.fromJson(e),
            ),
          ),
        );
      } else if (map is Map && map.keys.contains('is_rejected_order')) {
        state = AsyncValue.data(
          state.value
                  ?.where((element) => element.id != map['is_rejected_order'])
                  .toList() ??
              [],
        );
      } else if (map is Map && map['type'] == 'new_my_order') {
        final order = OrderModel.fromJson(map as Map<String, dynamic>);
        final index =
            state.value?.indexWhere((element) => element.id == order.id);
        if (index != -1 && index != null) {
          state = AsyncValue.data(
            (state.value as List<OrderModel>).map((value) {
              if (value.id == order.id) {
                return order;
              }
              return value;
            }).toList(),
          );
        } else {
          state = AsyncValue.data(
            [order, ...state.value ?? []],
          );
        }
      } else if (map is Map && map['type'] == 'current_status') {
        final order = OrderModel.fromJson(map as Map<String, dynamic>);
        int? index =
            state.value?.indexWhere((element) => element.id == order.id);

        if (index != -1 && index != null) {
          state = AsyncValue.data(order.status == OrderStatus.delivered
              ? (state.value as List<OrderModel>)
                  .where((element) => element.id != order.id)
                  .toList()
              : (state.value as List<OrderModel>).map((value) {
                  if (value.id == order.id) {
                    return order;
                  }
                  return value;
                }).toList());
        } else if (index == -1) {
          state = AsyncValue.data(
            List.from([
              OrderModel.fromJson(map),
              ...(state.value as List<OrderModel>),
            ]),
          );
        }
      }
    });

    return [];
  }
}


@riverpod
class MyDishOrderList extends _$MyDishOrderList {
  final socketHelper = WebSocketHelper('${Constants.wsBaseUrl}dish_orders_list/');

  @override
  Future<List<OrderDishModel>> build() async {
    await socketHelper.connect();

    socketHelper.send(
      jsonEncode(
        {
          "type": "my_dish_orders",
        },
      ),
    );
    socketHelper.stream().listen((event) {
      var map = jsonDecode(event);
      if (map is List) {
        state = AsyncValue.data(
          List.from(
            map.map(
              (e) => OrderDishModel.fromJson(e),
            ),
          ),
        );
      } else if (map is Map && map.keys.contains('is_rejected_order')) {
        state = AsyncValue.data(
          state.value
                  ?.where((element) => element.id != map['is_rejected_order'])
                  .toList() ??
              [],
        );
      } else if (map is Map && map['type'] == 'new_my_order') {
        final order = OrderDishModel.fromJson(map as Map<String, dynamic>);
        final index =
            state.value?.indexWhere((element) => element.id == order.id);
        if (index != -1 && index != null) {
          state = AsyncValue.data(
            (state.value as List<OrderDishModel>).map((value) {
              if (value.id == order.id) {
                return order;
              }
              return value;
            }).toList(),
          );
        } else {
          state = AsyncValue.data(
            [order, ...state.value ?? []],
          );
        }
      } else if (map is Map && map['type'] == 'current_status') {
        final order = OrderDishModel.fromJson(map as Map<String, dynamic>);
        int? index =
            state.value?.indexWhere((element) => element.id == order.id);

        if (index != -1 && index != null) {
          state = AsyncValue.data(order.status == OrderDishStatus.delivered
              ? (state.value as List<OrderDishModel>)
                  .where((element) => element.id != order.id)
                  .toList()
              : (state.value as List<OrderDishModel>).map((value) {
                  if (value.id == order.id) {
                    return order;
                  }
                  return value;
                }).toList());
        } else if (index == -1) {
          state = AsyncValue.data(
            List.from([
              OrderDishModel.fromJson(map),
              ...(state.value as List<OrderDishModel>),
            ]),
          );
        }
      }
    });

    return [];
  }
}

OrderStatus enumFromString(String key) {
  switch (key) {
    case 'pending':
      return OrderStatus.pending;
    case 'preparing':
      return OrderStatus.preparing;
    case 'payment_pending':
      return OrderStatus.paymentPending;
    case 'payment_check':
      return OrderStatus.paymentCheck;
    case 'planned':
      return OrderStatus.planned;
    case 'search_courier':
      return OrderStatus.searchCourier;
    case 'sending':
      return OrderStatus.sending;
    case 'canceled_by_client':
      return OrderStatus.canceledByClient;
    case 'canceled_by_shop':
      return OrderStatus.canceledByShop;

    default:
      return OrderStatus.canceled;
  }
}

@riverpod
class DeliveredOrders extends _$DeliveredOrders {
  int currentPage = 2;

  @override
  Future<List<OrderModel>> build() async {
    final response = await ref.read(orderRepoProvider).myOrderList(true);
    if (response.isSuccessful) {
      return response.result ?? const [];
    }

    return [];
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state =
        const AsyncValue<List<OrderModel>>.loading().copyWithPrevious(state);
    final response = await ref.read(orderRepoProvider).myOrderList(
          true,
          page: currentPage,
        );

    List<OrderModel> list = response.result ?? [];
    currentPage++;

    state = AsyncValue.data([...?state.value, ...list]);
  }
}

@riverpod
Future<ApiResponse> updateProducts(
    UpdateProductsRef ref, List<OrderItemUpdateModel> models) async {
  return ref.read(orderRepoProvider).updateProducts(models);
}
