import 'package:appkel_for_courier_flutter/data/models/product_model.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:appkel_for_courier_flutter/ui/widgets/transparent_text_form_field.dart";

class EditableProduct extends HookConsumerWidget {
  const EditableProduct(
    this.product, {
    super.key,
    this.onProductChanged,
  });

  final ProductModel product;
  final Function(double weight)? onProductChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityValue = useState<String?>(null);

    useEffect(() {
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: product.images.firstOrNull != null
                  ? CachedImage(
                      imageUrl: product.images.firstOrNull,
                      borderRadius: BorderRadius.circular(15),
                      height: 90,
                      width: 90,
                    )
                  : null,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.weight} ${getUnitName(product.unit)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (isNotNull(
                          product.weight, product.quantity, product.unit))
                        Text(
                          quantityValue.value ??
                              getKGorST(product.weight!,
                                  product.quantity!.toInt(), product.unit!),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        if (product.unit != Unit.st &&
            product.unit != Unit.liter &&
            isNotNull(product.weight, product.quantity, product.unit))
          Container(
            height: 31,
            width: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF034638),
              ),
            ),
            alignment: Alignment.center,
            child: TransparentTextFormField(
              lengthLimiting: 10,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF034638),
                fontWeight: FontWeight.w700,
              ),
              initialValue: getFormattedWeight(
                  product.weight!, product.quantity!.toInt(), product.unit!),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                quantityValue.value = value;
                onProductChanged?.call(double.parse(value));
              },
            ),
          ),
      ],
    );
  }
}

String getUnitName(Unit? unit) {
  switch (unit) {
    case Unit.kg:
      return 'кг';
    case Unit.gram:
      return 'г';
    case Unit.liter:
      return 'л';
    case Unit.st:
      return 'шт';
    default:
      return '';
  }
}

String getFormattedWeight(int weight, int quantity, Unit unit) {
  double totalWeight = weight.toDouble() * quantity;

  if (unit == Unit.gram) {
    totalWeight /= 1000; // convert grams to kilograms
  }

  return totalWeight.toStringAsFixed(2).replaceAll(RegExp(r'\.0*$'), '');
}

String getKGorST(int weight, int quantity, Unit unit) {
  switch (unit) {
    case Unit.kg:
    case Unit.gram:
      return '${getFormattedWeight(weight, quantity, unit)} кг';
    case Unit.liter:
    case Unit.st:
      return '${getFormattedWeight(weight, quantity, unit)} шт';
    default:
      return '';
  }
}

bool isNotNull(int? weight, double? quantity, Unit? unit) {
  return weight != null && quantity != null && unit != null;
}
