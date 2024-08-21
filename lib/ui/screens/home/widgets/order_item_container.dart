import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/order_model.dart';
import '../../../../data/models/profile_model.dart';
import '../../../../providers/user_providers.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/preview_order_widget.dart';

class OrderItemContainer extends HookConsumerWidget {
  const OrderItemContainer({
    super.key,
    required this.order,
    this.isHasCourier = false,
  });

  final OrderModel order;
  final bool isHasCourier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return GestureDetector(
      onTap: () async {
        if (userState.role == null) return;
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => PreviewOrder(
            order: order,
            role: userState.role!,
            isHasCourier: false,
            isHasAcceptRejectButton: true,
            warningAboutHasDiscount: true,
            isShowDiscount: true,
          ),
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#${order.id}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            if (userState.role == Role.salesman &&
                order.houseAddress != null) ...[
              Row(
                children: [
                  const AppIcon(AppIcons.location, size: 20),
                  const Gap(5),
                  Text(
                    order.houseAddress!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
              const Gap(15),
            ],
            if (order.products.isNotEmpty) ...[
              Row(
                children: [
                  const AppIcon(AppIcons.element_equal, size: 20),
                  const Gap(5),
                  Text(
                    '${order.products.length} товаров',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ],
            if (order.phoneNumber != null) ...[
              const Gap(15),
              Row(
                children: [
                  const AppIcon(
                    AppIcons.call,
                    size: 20,
                    color: Color(0xFFAEAEAE),
                  ),
                  const Gap(5),
                  Expanded(
                    child: Text(
                      order.phoneNumber!,
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const Spacer(),
            Container(
              height: 37,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFFF6C29)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              alignment: Alignment.center,
              child: const FittedBox(
                child: Text(
                  'Посмотреть заказ',
                  style: TextStyle(
                    color: Color(0xFFFF6C29),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
