import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/widgets/amount_dish_quantity_widget.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/dish_tile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDishPaymentView extends HookConsumerWidget {
  const OrderDishPaymentView({
    super.key,
    required this.order,
    required this.status,
  });

  final OrderDishModel order;
  final OrderDishStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
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
        if (status == OrderDishStatus.preparing)
          GestureDetector(
            onTap: () async {
              ref
                  .read(orderDishDetailProvider(order.id!).notifier)
                  .cookingComplete(order.price!);
            },
            child: Container(
              height: 45,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6C29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Готовка завершена',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
