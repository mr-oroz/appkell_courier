import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/product_model.dart';
import '../../../widgets/cached_image.dart';
import '../../main_screen/main_screen.dart';

class DishtTileItem extends HookConsumerWidget {
  const DishtTileItem({
    super.key,
    required this.product,
    this.cardWidth,
    this.isAfterEditing = false,
    this.isShowPrice = true,
    this.isShowDiscount = true,
  });

  final DishesModel product;
  final double? cardWidth;
  final bool isAfterEditing;
  final bool isShowPrice;
  final bool isShowDiscount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: cardWidth,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              if (product.image != null && product.image!.isNotEmpty)
                ...product.image!.map((item) {
                  return SizedBox(
                    height: 90,
                    width: 90,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: CachedImage(
                          imageUrl: item.image.toString(),
                        ),
                      ),
                    ),
                  );
                })

              //if (product.price?.discount != null && isShowDiscount)
              //  Container(
              //    height: 22,
              //    width: 49,
              //    margin: const EdgeInsets.only(right: 6, bottom: 6),
              //    decoration: BoxDecoration(
              //      borderRadius: BorderRadius.circular(6),
              //      color: const Color(0xFF30B800),
              //    ),
              //    alignment: Alignment.center,
              //    child: Text(
              //      '-${product.price!.discount}%',
              //      style: const TextStyle(
              //        fontWeight: FontWeight.w700,
              //        color: Colors.white,
              //      ),
              //    ),
              //  )
            ],
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.name != null)
                  Text(
                    product.name!,
                    style: const TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                if (product.calories != null)
                  Text.rich(
                    TextSpan(text:'${product.calories}г'),
                    style: const TextStyle(
                      color: Color(0xFFA4A4A4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const Gap(12),
                Row(
                  mainAxisAlignment: isShowPrice
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (product.price != null && isShowPrice)
                      Row(
                        children: [
                          Text(
                            "${product.price.toString()} сом",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          //if (isShowDiscount &&
                          //    product.price?.discount != null) ...[
                          //  const Gap(16),
                          //  Text(
                          //    product.price!.oldPrice.toStringAsFixed(2),
                          //    textAlign: TextAlign.center,
                          //    style: const TextStyle(
                          //      color: Color(0xFFA4A4A4),
                          //      fontSize: 15,
                          //      fontWeight: FontWeight.w500,
                          //      height: 0,
                          //      decoration: TextDecoration.lineThrough,
                          //    ),
                          //  ),
                          //]
                        ],
                      ),
                    //if (product.unit != null)
                    //  Text(
                    //    isAfterEditing
                    //        ? getKGorST(product.quantity, product.unit!)
                    //        : '${product.quantity.toInt()} шт',
                    //    textAlign: TextAlign.center,
                    //    style: const TextStyle(
                    //      color: Colors.black,
                    //      fontSize: 17,
                    //      fontWeight: FontWeight.w400,
                    //      height: 0,
                    //    ),
                    //  )
                  ],
                )
              ],
            ),
          ),
          const Gap(20)
        ],
      ),
    );
  }
}

String getKGorST(double quantity, Unit unit) {
  switch (unit) {
    case Unit.kg:
    case Unit.gram:
      return '$quantity кг';
    case Unit.liter:
    case Unit.st:
      return '${quantity.toInt()} шт';
    default:
      return '';
  }
}

String getPrice(double price, double oldPrice, int? discount) {
  if (discount != null) {
    return '${price.toStringAsFixed(2)} c';
  } else {
    return '${oldPrice.toStringAsFixed(2)} c';
  }
}
