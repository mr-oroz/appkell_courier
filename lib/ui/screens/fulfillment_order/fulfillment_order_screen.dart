import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/timers_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_payment_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_pending_view.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/order_sending_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/models/duration_timers_model.dart';
import '../../../data/models/order_model.dart';

import '../main_screen/main_screen.dart';
import 'widgets/order_canceled_by_shop_view.dart';
import 'widgets/order_payment_check_view.dart';
import 'widgets/order_planned_view.dart';

class FulfillmentOrderScreen extends HookConsumerWidget {
  const FulfillmentOrderScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(orderDetailProvider(id));

    final order = useState<OrderModel?>(null);
    final status = order.value?.status;
    final timers = useState<DurationTimersModel?>(null);
    final exactAmount = useState('');

    ref.listen(
      orderDetailProvider(id),
      (previous, next) {
        timers.value = next.timers;
        if (next.order == null) return;
        if (next.order?.status != order.value?.status) {
          order.value = next.order;

          if (order.value?.status == OrderStatus.paymentPending) {
            // order = next.order!;
          } else if (order.value?.status == OrderStatus.paymentCheck) {
            // order = next.order!;
          } else if (order.value?.status == OrderStatus.searchCourier) {
            // order = next.order!;
          } else if (order.value?.status == OrderStatus.sending) {
            // order = next.order!;
          } else if (order.value?.status == OrderStatus.canceledByClient) {
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
          } else if (order.value?.status == OrderStatus.delivered) {
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
                TimersView(
                  timeStampDelivery: order.value?.timeStampDelivery,
                  status: status,
                  durationTimersModel: timers.value!,
                ),
              if (status == OrderStatus.preparing && order.value != null) ...[
                OrderPendingView(
                  id: order.value!.id,
                  approximateAmount: order.value?.price.toString(),
                  onCookingComplete: (value) {
                    exactAmount.value = value;
                  },
                ),
              ] else if (status == OrderStatus.paymentPending) ...[
                OrderPaymentView(
                  order: order.value!,
                ),
              ] else if (status == OrderStatus.paymentCheck) ...[
                OrderPaymentCheckView(
                  order: order.value!,
                ),
              ] else if (status == OrderStatus.canceledByShop) ...[
                OrderCanceledByShopView(
                  order: order.value!,
                )
              ] else if (status == OrderStatus.planned &&
                  order.value != null &&
                  order.value?.timeStampDelivery != null) ...[
                OrderPlannedView(
                  timeStampDelivery: order.value!.timeStampDelivery!,
                  order: order.value!,
                ),
              ] else if (status == OrderStatus.searchCourier ||
                  status == OrderStatus.sending) ...[
                OrderSendingView(
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
