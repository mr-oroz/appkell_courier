import 'package:appkel_for_courier_flutter/providers/my_order_providers.dart';
import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/amount_dish_quantity_widget.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/dish_tile_item_widget.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/preview_dish_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/order_model.dart';
import '../../../../providers/user_providers.dart';
import '../../../widgets/client_paid_dialog.dart';


class OrderDishSendingView extends HookConsumerWidget {
  const OrderDishSendingView({super.key, required this.order});

  final OrderDishModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    return Column(
      children: [
        const Gap(30),
        ClientPaidDialog(
          orderId: order.id!,
          checkImage: order.payCheck,
          paymentMethod: order.paymentMethod,
        ),
        const Gap(10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () async {
              if (userState.role == null) return;
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => PreviewDishOrder(
                  order: order,
                  role: userState.role!,
                  isHasCourier: userState.isHasCourier,
                  warningAboutHasDiscount: true,
                  isShowDiscount: true,
                ),
              );
            },
            child: const Text('Просмотреть заказ'),
          ),
        ),
        const Gap(30),
        if (order.dishes.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemCount: order.dishes.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DishtTileItem(
                isAfterEditing: true,
                cardWidth: 281,
                product: order.dishes[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(20);
            },
          ),
        //else if (order.quickOrderText != null) ...[
        //  const Gap(20),
        //  Align(
        //    alignment: Alignment.centerLeft,
        //    child: Text(
        //      order.quickOrderText!,
        //      style: const TextStyle(
        //        fontSize: 16,
        //        fontWeight: FontWeight.w500,
        //      ),
        //    ),
        //  ),
        //],
        AmountDishQuantityWidget(order: order),
        const Gap(20),
        if (userState.isHasCourier)
          ElevatedButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Завершить заказ?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text(
                        'Завершить отправку заказа',
                        style: TextStyle(
                          color: Color(0xFFF81515),
                        ),
                      ),
                      onPressed: () {
                        ref
                            .read(orderDishDetailProvider(order.id!).notifier)
                            .completeOrder();
                        ref.refresh(myDishOrderListProvider);
                        Navigator.pop(context);
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
            child: const Text('Завершить отправку заказа'),
          ),
        const Gap(10),
      ],
    );
  }
}
