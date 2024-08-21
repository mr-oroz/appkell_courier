import 'dart:async';
import 'dart:convert';

import 'package:appkel_for_courier_flutter/config/config.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/order_model.dart';
import '../helpers/io_socket.helper.dart';

part 'order_providers.g.dart';

@riverpod
class OrderList extends _$OrderList {
  final socketHelper = WebSocketHelper('${Constants.wsBaseUrl}orders_list/');

  @override
  Future<List<OrderModel>> build() async {
    return [];
  }

  Future connectToSocket((double lat, double lon)? value) async {
    await socketHelper.connect();
    socketHelper.send(
      jsonEncode(
        {
          "type": "get_orders",
        },
      ),
    );
    socketHelper.stream().listen((event) {
      var map = jsonDecode(event);
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
      } else if (map is Map &&
          map.keys.contains('id') &&
          map['type'] != 'current_status') {
        final index =
            state.value?.indexWhere((element) => element.id == map['id']);
        state = AsyncValue.data(
          List.from([
            ...(state.value as List<OrderModel>),
            // OrderModel.fromJson(map as Map<String, dynamic>),
            if (index == -1) OrderModel.fromJson(map as Map<String, dynamic>),
          ]),
        );
      }
    });
  }

  void rejectOrder(int orderId) {
    socketHelper.send(
      jsonEncode({
        "type": "reject_order",
        "order_id": orderId,
      }),
    );
  }

  void close() {
    socketHelper.close();
    state = const AsyncValue.data([]);
  }

  void refreshData() {
    // state = const AsyncValue.data([]);
    // socketHelper.send(
    //   jsonEncode(
    //     {
    //       "type": "get_orders",
    //     },
    //   ),
    // );
  }

  void deleteOrder(int orderId) {
    state = AsyncValue.data(
      state.value?.where((element) => element.id != orderId).toList() ?? [],
    );
  }
}


@riverpod
class OrderDishList extends _$OrderDishList {
  final socketHelper = WebSocketHelper('${Constants.wsBaseUrl}dish_orders_list/');

  @override
  Future<List<OrderDishModel>> build() async {
    return [];
  }

  Future connectToSocket((double lat, double lon)? value) async {
    await socketHelper.connect();
    socketHelper.send(
      jsonEncode(
        {
          "type": "get_dish_orders",
          //"latitude": 42.833673,
          //"longitude": 74.601936,
          if(value != null) "latitude": value.$1,
          if(value != null) "longitude": value.$2
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
      } else if (map is Map &&
          map.keys.contains('id') &&
          map['type'] != 'current_status') {
        final index =
            state.value?.indexWhere((element) => element.id == map['id']);
        state = AsyncValue.data(
          List.from([
            ...(state.value as List<OrderDishModel>),
            // OrderModel.fromJson(map as Map<String, dynamic>),
            if (index == -1) OrderDishModel.fromJson(map as Map<String, dynamic>),
          ]),
        );
      }
    });
  }

  void rejectOrder(int orderId) {
    socketHelper.send(
      jsonEncode({
        "type": "reject_dish_order",
        "order_id": orderId,
      }),
    );
  }

  void close() {
    socketHelper.close();
    state = const AsyncValue.data([]);
  }

  void refreshData() {
    // state = const AsyncValue.data([]);
    // socketHelper.send(
    //   jsonEncode(
    //     {
    //       "type": "get_orders",
    //     },
    //   ),
    // );
  }

  void deleteOrder(int orderId) {
    state = AsyncValue.data(
      state.value?.where((element) => element.id != orderId).toList() ?? [],
    );
  }
}
