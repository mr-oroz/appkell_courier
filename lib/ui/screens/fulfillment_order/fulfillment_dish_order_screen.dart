import 'dart:ffi';

import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/timers_dish_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/open_dish_planned_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_dish_canceled_by_shop_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_dish_payment.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_dish_payment_check_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_dish_sending_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_pending_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/models/duration_timers_model.dart';
import '../../../data/models/order_model.dart';

import '../main_screen/main_screen.dart';

class FulfillmentDishOrderScreen extends HookConsumerWidget {
  const FulfillmentDishOrderScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(orderDishDetailProvider(id));

    final order = useState<OrderDishModel?>(null);
    final status = order.value?.status;
    final timers = useState<DurationDishTimersModel?>(null);

    ref.listen(
      orderDishDetailProvider(id),
      (previous, next) {
        order.value = next.order;
        timers.value = next.timers;
        if (next.order == null) return;
        if (next.order?.status != previous?.order?.status) {
          //order.value = next.order;
          //order.value = next.order;
          if (order.value?.status == OrderDishStatus.preparing) {
            // order = next.order!;
          } else if (order.value?.status == OrderDishStatus.searchCourier) {
            // order = next.order!;
          } else if (order.value?.status == OrderDishStatus.sending) {
            // order = next.order!;
          } else if (order.value?.status == OrderDishStatus.canceledByClient) {
            SnackBar snackBar = const SnackBar(
              content: Text('Заказ отменен клиентом'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
              (_) {
                return false;
              },
            );
          } else if (order.value?.status == OrderDishStatus.delivered) {
            SnackBar snackBar = const SnackBar(
              content: Text('Заказ завершен'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
              (_) {
                return false;
              },
            );
          }
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              if (timers.value != null && status != null)
                TimersDishView(
                  timeStampDelivery: order.value?.timestamp,
                  status: status,
                  durationTimersModel: timers.value!,
                ),
              if ((status == OrderDishStatus.preparing || status == OrderDishStatus.searchCourier) && order.value != null && status != null ) ...[
                OrderDishPaymentView(
                  order: order.value!,
                  status: status,
                ),
              ] else if (status == OrderDishStatus.canceledByShop) ...[
                OrderDishCanceledByShopView(
                  order: order.value!,
                )
              ] else if (status == OrderDishStatus.planned &&
                  order.value != null &&
                  order.value?.timestamp != null) ...[
                OrderDishPlannedView(
                  timeStampDelivery: order.value!.timestamp!,
                  order: order.value!,
                ),
              ] else if ((status == OrderDishStatus.sending ||
                          status == OrderDishStatus.delivered) && order.value != null ) ...[
                OrderDishSendingView(
                  order: order.value!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
