import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/order_model.dart';
import '../../../../providers/user_providers.dart';
import '../../../widgets/preview_order_widget.dart';
import '../../profile/widgets/product_tile_item_widget.dart';
import 'amount_quantity_widget.dart';

class OrderPlannedView extends HookConsumerWidget {
  const OrderPlannedView(
      {super.key, required this.timeStampDelivery, required this.order});

  final String timeStampDelivery;
  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    return Column(
      children: [
        const Gap(40),
        if (order.products.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemCount: order.products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductTileItem(
                cardWidth: 281,
                isAfterEditing: true,
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
        const Gap(10),
        Text(
          'Заказ запланирован на $timeStampDelivery',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
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
                builder: (context) => PreviewOrder(
                  order: order,
                  role: userState.role!,
                  isHasCourier: userState.isHasCourier,
                ),
              );
            },
            child: const Text('Просмотреть заказ'),
          ),
        ),
      ],
    );
  }

  String getTimeStampDelivery(String timeStampDelivery) {
    // Разбиваем строку на часы и минуты
    List<String> timeParts = timeStampDelivery.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Создаем DateTime с текущей датой и временем доставки
    DateTime deliveryDateTime = DateTime(DateTime.now().year,
        DateTime.now().month, DateTime.now().day, hour, minute);

    // Получение текущего времени
    DateTime now = DateTime.now();

    // Сравнение времени
    if (now.isAfter(deliveryDateTime)) {
      // Если текущее время позже, чем время доставки, форматируем дату для отображения дня и месяца
      String dayAndMonth = DateFormat('dd MMMM').format(deliveryDateTime);
      return dayAndMonth;
    } else {
      // Если время доставки еще не наступило, не отображаем день и месяц
      return 'Delivery time is in the future';
    }
  }
}
