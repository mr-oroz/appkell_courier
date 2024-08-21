import 'package:another_flushbar/flushbar.dart';
import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:appkel_for_courier_flutter/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_icon.dart';

class OrderDetailsDishView extends StatelessWidget {
  const OrderDetailsDishView({
    super.key,
    required this.role,
    required this.order,
    required this.isHasCourier,
    this.isShowPrice = true,
    this.warningAboutHasDiscount = false,
  });

  final Role role;
  final OrderDishModel order;
  final bool isHasCourier;
  final bool isShowPrice;
  final bool warningAboutHasDiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Container(
            width: 54,
            height: 6,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        const Gap(12),
        Text(
          'Заказ #${order.id}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        //if (warningAboutHasDiscount &&
        //    order.dishes
        //        .where((element) => element.price?.discount != null)
        //        .isNotEmpty) ...[
        //  const Gap(16),
        //  const Text(
        //    'Пользователь заказал блюды по скидке, хотите ли принять заказ',
        //    style: TextStyle(
        //      fontSize: 15,
        //      color: Color(0xFF505050),
        //    ),
        //  ),
        //],
        if (role == Role.courier || isHasCourier) ...[
          const Gap(13),
          if (order.address != null &&
              order.address != null &&
              order.address != null) ...[
            Row(
              children: [
                const AppIcon(AppIcons.location, size: 20),
                const Gap(5),
                if (order.address != null) ...[
                  SizedBox(
                    width: order.latitude != null &&
                            order.longitude != null
                        ? 153
                        : null,
                    child: Text(
                      order.address!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const Spacer(),
                ],
                if (order.latitude != null && order.longitude != null)
                  GestureDetector(
                    onTap: () {
                      openMap(order.latitude!, order.longitude!);
                    },
                    child: Text(
                      'посмотреть в 2Gis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColor),
                    ),
                  ),
              ],
            ),
            const Gap(15),
          ],
          if (order.entrance != null) Text('Подъезд - ${order.entrance}'),
          if (order.floor != null) Text('Этаж - ${order.floor}'),
          if (order.address != null)
            Text('Номер дома - ${order.address}'),
          if (order.apartment != null)
            Text('Квартира / Кабинет - ${order.apartment}'),
          if (order.dishes.isNotEmpty) ...[
            Row(
              children: [
                const AppIcon(AppIcons.element_equal, size: 20),
                const Gap(5),
                Text(
                  '${order.dishes.length} блюд',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            ),
            const Gap(15),
          ],
          if (order.phone != null) ...[
            const Gap(20),
            const Row(
              children: [
                AppIcon(
                  AppIcons.call,
                  size: 20,
                  color: Color(0xFFAEAEAE),
                ),
                Gap(5),
                Text(
                  '+996 500 456 654',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            const Gap(16)
          ],
          if (order.comment != null) ...[
            const Text(
              'Комментарии к заказу',
              style: TextStyle(
                color: Color(0xFFA4A4A4),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(5),
            Container(
              width: double.infinity,
              height: 53,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                order.comment!,
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Gap(15),
          ],
          if (order.doNotDisturb == true) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Не беспокоить',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Flushbar(
                      message:
                          'Клиент попросил не беспокоить. Оставьте заказ у двери.',
                      duration: const Duration(seconds: 5),
                      flushbarStyle: FlushbarStyle.GROUNDED,
                    ).show(context);
                  },
                  icon: const AppIcon(AppIcons.warning),
                ),
              ],
            ),
          ],
          ],
          const Gap(35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Блюд',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            if (order.dishes.isNotEmpty &&
                (role == Role.restaurant || isHasCourier) &&
                isShowPrice)
              Text(
                '${order.dishes.fold(
                  0,
                  (previousValue, element) =>
                      previousValue + (element.quantity!.toInt()),
                )} шт',
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
          ],
        ),
      ],
    );
  }

  openMap(double lat, double long) async {
    // String googleUrl =
    //     "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    // String twoGis = 'https://2gis.kg/geo/15763208581152775/$lat,$long';

    String uri = "geo:"
        '$lat'
        ","
        '$long'
        "?q="
        '$lat'
        ","
        '$long';

    launch(uri);
  }
}
