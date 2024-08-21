import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/order_model.dart';
import 'dependencies.dart';

part 'listener_order_status_providers.g.dart';

@riverpod
class ListenerOrderStatus extends _$ListenerOrderStatus {
  Timer? _timer;
  @override
  Future<OrderModel?> build(int orderId) async {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      final response = await ref.read(orderRepoProvider).myOrderList(null);

      if (response.isSuccessful) {
        final order =
            response.result?.firstWhere((element) => element.id == orderId);

        _setOrderList(order);
      }
    });
    ref.onDispose(() {
      _timer?.cancel();
    });
    return null;
  }

  void _setOrderList(OrderModel? order) {
    state = AsyncValue.data(order);
  }

  void stopTimer() {
    _timer?.cancel();
  }
}

@riverpod
class CheckPreparingTime extends _$CheckPreparingTime {
  @override
  Future<List<Duration>?> build({int? orderId}) async {
    final response =
        await ref.read(orderRepoProvider).checkPreparingTime(orderId);
    return response.result;
  }
}
