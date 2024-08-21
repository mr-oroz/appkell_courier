import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/amount_quantity_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/client_paid_dialog.dart';

class OrderPaymentCheckView extends HookConsumerWidget {
  const OrderPaymentCheckView({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Gap(30),
        const Text(
          'Принятие оплаты',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        ClientPaidDialog(
          orderId: order.id,
          checkImage: order.payCheck,
          paymentMethod: order.paymentMethod,
        ),
        const Gap(10),
        AmountQuantityWidget(order: order),
        GestureDetector(
          onTap: () {
            ref
                .read(orderDetailProvider(order.id).notifier)
                .paymentCheckComplete(
                    order.timeStampDelivery != null, order.id);
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Принять оплату',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
        const Gap(10),
        GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title:
                    const Text('Вы действительно хотите отказаться от оплаты?'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text(
                      'Да, отказаться',
                      style: TextStyle(
                        color: Color(0xFFF81515),
                      ),
                    ),
                    onPressed: () async {
                      ref
                          .read(orderDetailProvider(order.id).notifier)
                          .refusePayment();
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text('Отмена'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'Отказаться от оплаты',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
                fontSize: 17,
              ),
            ),
          ),
        ),
        const Gap(40),
      ],
    );
  }
}
