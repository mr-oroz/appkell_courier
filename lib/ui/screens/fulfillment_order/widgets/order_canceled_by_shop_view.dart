import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/order_model.dart';
import '../../../../providers/whatsapp_number_provider.dart';
import '../../../widgets/app_icon.dart';
import '../../profile/more_profile_screen.dart';
import '../../profile/widgets/product_tile_item_widget.dart';
import 'amount_quantity_widget.dart';

class OrderCanceledByShopView extends HookConsumerWidget {
  const OrderCanceledByShopView({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final whatsappNumberState = ref.watch(whatsappNumberProvider);

    return Column(
      children: [
        const Gap(30),
        if (!order.paymentMethod.isWallet) ...[
          const Center(
            child: Text(
              'Вы отменили заказ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ] else ...[
          const Center(
            child: Text(
              'Если вы получили средства на счет, пожалуйста, возвращайте их на счет клиента вручную и отправьте чек в техподдержку.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Gap(10),
          const Text('Изображение чека:'),
          const Gap(10),
          if (order.payCheck != null) Image.network(order.payCheck!),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Сумма возврата:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${order.price}c',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap(20),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
          InkWell(
            onTap: () {
              final phone = whatsappNumberState.value;
              if (phone != null) {
                openWhatsapp(phone);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Служба поддержки',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppIcon(AppIcons.arrow_right),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
        ],
        const Gap(35),
        if (order.products.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemCount: order.products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductTileItem(
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
          Text(
            order.quickOrderText!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        const Gap(10),
        AmountQuantityWidget(order: order),
      ],
    );
  }
}
