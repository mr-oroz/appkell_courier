import 'package:another_flushbar/flushbar.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/product_model.dart';
import '../screens/main_screen/main_screen.dart';
import 'product_discount_sheet.dart';
import 'product_price_sheet.dart';

class ProductDetailsSheet extends HookConsumerWidget {
  const ProductDetailsSheet({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselController = CarouselSliderController();
    final currentIndex = useState(0);

    final price = useState<String?>(
        model.price?.isMyPrice == true ? model.price?.price.toString() : null);
    final discount = useState<MapEntry<int, String>?>(
        model.price?.isMyDiscount == true
            ? MapEntry(model.price!.discount ?? 0, '')
            : null);

    final addPricModalBottomSheet = useCallback(() async {
      final value = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return ProductPriceSheet(model.id);
        },
      );
      if (value != null) {
        price.value = value;
        ref.invalidate(productsListProvider);
        Flushbar(
          message: 'Цена успешно добавлена',
          duration: const Duration(seconds: 3),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      }
    }, []);
    final addDiscountModalBottomSheet = useCallback(() async {
      final value = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return ProductDiscountSheet(model.id);
        },
      );
      if (value != null && value is MapEntry<int, String>) {
        discount.value = value;
        ref.invalidate(productsListProvider);
        Flushbar(
          message: 'Скидка успешно добавлена',
          duration: const Duration(seconds: 3),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      }
    }, []);

    return DraggableScrollableSheet(
      // initialChildSize: 1,
      // minChildSize: 1,
      // maxChildSize: 1,

      initialChildSize: 0.99,
      minChildSize: 0.6,
      maxChildSize: 1,
      expand: false,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                const Gap(69),
                CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: 363,
                    aspectRatio: 1,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                    },
                  ),
                  items: model.images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: model.images.asMap().entries.map((entry) {
                    return Container(
                      width: 7,
                      height: 7,
                      margin: const EdgeInsets.only(right: 5, top: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (currentIndex.value == entry.key)
                            ? const Color(0xFFFF6C29)
                            : const Color(0xFFD9D9D9),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(15),
                      if (model.title != null)
                        Text(
                          model.title!,
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      const Gap(10),
                      if (model.weight != null)
                        Text.rich(
                          TextSpan(
                            text: model.weight!.toString(),
                            children: [
                              if (model.unit != null)
                                TextSpan(
                                  text: getUnit(model.unit!),
                                ),
                            ],
                          ),
                          style: const TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      const Gap(15),
                      Container(
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFF6F6F6),
                            ),
                          ),
                        ),
                      ),
                      const Gap(15),
                      const Text(
                        'Состав:',
                        style: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Gap(5),
                      if (model.composition != null)
                        Text(
                          model.composition!,
                          style: const TextStyle(
                            color: Color(0xFF434343),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      const Gap(15),
                      const Text(
                        'Производитель:',
                        style: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Gap(5),
                      if (model.manufacturer != null)
                        Text(
                          model.manufacturer!,
                          style: const TextStyle(
                            color: Color(0xFF434343),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      const Gap(75),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [],
                      ),
                      if (price.value == null)
                        GestureDetector(
                          onTap: () async {
                            if (price.value != null) {
                              return;
                            }
                            addPricModalBottomSheet();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFF6C29),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Добавить цену',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      else ...[
                        GestureDetector(
                          onTap: () {
                            addPricModalBottomSheet();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Ваша цена ${price.value!} сом',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const Gap(16),
                      if (discount.value == null)
                        GestureDetector(
                          onTap: () async {
                            addDiscountModalBottomSheet();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFFF6C29),
                                  )),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Добавить скидку %',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      else ...[
                        GestureDetector(
                          onTap: () async {
                            addDiscountModalBottomSheet();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Ваша скидка ${discount.value!.key}%',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const Gap(30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
