import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/category_model.dart';
import '../../../widgets/cached_image.dart';
import '../../products/products_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFCFCFC),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsScreen(
                  appBarTitleText: category.categoryName,
                  categoryId: category.id,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (category.categoryName != null)
                  Text(
                    category.categoryName!,
                    style: const TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                const Gap(5),
                if (category.productCount != null)
                  Text(
                    '${category.productCount} продуктов',
                    style: const TextStyle(
                      color: Color(0xFFA4A4A4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CachedImage(
                    imageUrl: category.image ?? '',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
