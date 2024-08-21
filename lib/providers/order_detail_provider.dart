import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:appkel_for_courier_flutter/data/models/duration_timers_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../config/config.dart';
import '../data/models/order_item_update_model.dart';
import '../data/models/order_model.dart';
import '../data/repo/order_repo.dart';
import '../helpers/io_socket.helper.dart';

part 'order_detail_provider.g.dart';
part 'order_detail_provider.freezed.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState({
    OrderModel? order,
    DurationTimersModel? timers,
    bool? isClosed,
  }) = _OrderState;

  factory OrderDetailState.initial() => const OrderDetailState();
}

@riverpod
class OrderDetail extends _$OrderDetail {
  late WebSocketHelper socketHelper;
  bool isSocketConnected = false;

  @override
  OrderDetailState build(int orderId) {
    return const OrderDetailState();
  }

  Future connectToSocket(int orderId) async {
    socketHelper = WebSocketHelper('${Constants.wsBaseUrl}orders/$orderId/');

    if (isSocketConnected == false) {
      final webSocket = await socketHelper.connect();
      Timer.periodic(const Duration(microseconds: 1500), (timer) {
        if (webSocket.readyState == WebSocket.closed) {
          state = state.copyWith(isClosed: true);
          timer.cancel();
        }
      });
      isSocketConnected = await socketHelper.isConnected();
    }

    socketHelper.stream().listen(
      (event) {
        if (event == null) return;
        var map = jsonDecode(event) as Map<String, dynamic>;
        // print('3 websocket event: $map');

        // var mapForPrinting = Map<String, dynamic>.from(map);
        // mapForPrinting.remove('products');

        if (map.keys.contains('order')) {
          var order = OrderModel.fromJson(map['order']);
          state = state.copyWith(order: order);
        } else if (map.keys.contains('preparing_timer')) {
          DurationTimersModel timers = DurationTimersModel(
            preparing: durationFromJson(map['preparing_timer']),
            paymentPending: durationFromJson(map['payment_pending_timer']),
            paymentCheck: durationFromJson(map['processing_timer']),
            sending: durationFromJson(map['courier_sending_timer']),
            sendingSettings: durationFromJson(map['sending_settings']),
          );
          state = state.copyWith(timers: timers);
        }
      },
    );
  }

  void closeTheSocket() {
    socketHelper.close();
    state = state.copyWith();
  }

  void cookingComplete(int exactSum) {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": "payment_pending",
          "exact_sum": exactSum
        },
      ),
    );
  }

  void updateWeight(List<OrderItemUpdateModel> productItems) {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order_quantity",
          "order_items": productItems.map((e) => e.toJson()).toList()
        },
      ),
    );
  }

  void getTimers() {
    if (state.timers != null) return;

    socketHelper.send(
      jsonEncode(
        {
          "type": "get_timer",
        },
      ),
    );
  }

 

  void paymentCheckComplete(bool isTimestampDelivery, int orderId) async {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": isTimestampDelivery ? "planned" : "sending",
        },
      ),
    );
  }

  void refusePayment() {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": "canceled_by_shop",
        },
      ),
    );
  }

  void completeOrder() {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": "delivered",
        },
      ),
    );
  }
}

@freezed
class OrderDishDetailState with _$OrderDishDetailState {
  const factory OrderDishDetailState({
    OrderDishModel? order,
    DurationDishTimersModel? timers,
    bool? isClosed,
  }) = _OrderDishDetailState;

  factory OrderDishDetailState.initial() => const OrderDishDetailState();
}

@riverpod
class OrderDishDetail extends _$OrderDishDetail {
  late WebSocketHelper socketHelper;
  bool isSocketConnected = false;

  @override
  OrderDishDetailState build(int orderId) {
    return const OrderDishDetailState();
  }

  Future connectToSocket(int orderId) async {
    socketHelper =
        WebSocketHelper('${Constants.wsBaseUrl}dish_orders/$orderId/');

    if (isSocketConnected == false) {
      final webSocket = await socketHelper.connect();
      Timer.periodic(const Duration(microseconds: 1500), (timer) {
        if (webSocket.readyState == WebSocket.closed) {
          state = state.copyWith(isClosed: true);
          timer.cancel();
        }
      });
      isSocketConnected = await socketHelper.isConnected();
    }

    socketHelper.stream().listen(
      (event) {

        if (event == null) return;
        var map = jsonDecode(event) as Map<String, dynamic>;
        if (map.keys.contains('order')) {
          var order = OrderDishModel.fromJson(map['order']);
          state = state.copyWith(order: order);
        } else if (map.keys.contains('preparing_timer')) {
          DurationDishTimersModel timers = DurationDishTimersModel(
            preparing: durationFromJson(map['preparing_timer']),
            courierSendingTimer: durationFromJson(map['courier_sending_timer']),
            sendingSettings: durationFromJson(map['sending_settings']),
          );
          state = state.copyWith(timers: timers);
        }
      },
    );
  }

  void closeTheSocket() {
    socketHelper.close();
    state = state.copyWith();
  }

  void cookingComplete(int exactSum) {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          'status': 'search_courier'
        },
      ),
    );
  }

  void updateWeight(List<OrderItemUpdateModel> productItems) {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order_quantity",
          "order_items": productItems.map((e) => e.toJson()).toList()
        },
      ),
    );
  }

  void getTimers() {
    if (state.timers != null) return;

    socketHelper.send(
      jsonEncode(
        {
          "type": "get_timer",
        },
      ),
    );
  }

  void paymentCheckComplete(bool isTimestampDelivery, int orderId) async {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": isTimestampDelivery ? "planned" : "sending",
        },
      ),
    );
  }

  void refusePayment() {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": "canceled_by_restaurant",
        },
      ),
    );
  }

  void completeOrder() {
    socketHelper.send(
      jsonEncode(
        {
          "type": "update_order",
          "status": "delivered",
        },
      ),
    );
  }
}
