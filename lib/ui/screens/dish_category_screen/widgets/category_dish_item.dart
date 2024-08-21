import 'package:appkel_for_courier_flutter/data/models/category_model.dart';
import 'package:appkel_for_courier_flutter/ui/screens/dish_category_screen/dish_detail_screen.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryDishItem extends StatelessWidget {
  const CategoryDishItem({
    super.key,
    required this.item,
  });

  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DishDetailScreen(
              item.categoryName ?? '',
              item.id,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 1.4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.categoryName ?? '',
                style: const TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${item.productCount ?? 0} позиций',
                style: const TextStyle(
                  color: Color(0xFFA4A4A4),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: CachedImage(
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                  imageUrl: item.image ?? '',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
