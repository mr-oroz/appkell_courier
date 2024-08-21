import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import '../../profile/widgets/product_tile_item_widget.dart';
import 'amount_quantity_widget.dart';

class OrderPaymentView extends StatelessWidget {
  const OrderPaymentView({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        if (order.products.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemCount: order.products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductTileItem(
                isAfterEditing: true,
                cardWidth: 281,
                product: order.products[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(20);
            },
          )
        else if (order.quickOrderText != null) ...[
          const Gap(20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              order.quickOrderText!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        AmountQuantityWidget(order: order),
      ],
    );
  }
}
