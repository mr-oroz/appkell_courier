import 'package:appkel_for_courier_flutter/data/models/category_model.dart';
import 'package:appkel_for_courier_flutter/helpers/cross_axis_count.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/dish_category_screen/widgets/add_category_dish_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/screens/dish_category_screen/widgets/category_dish_item.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DishCategoryScreen extends HookConsumerWidget {
  const DishCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = useState(null);
    final provider = useMemoized(
      () => categoryDishListProvider(search: searchText.value),
      [searchText.value],
    );
    final categoryListState = ref.watch(provider);

    final scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (categoryListState.isRefreshing ||
            categoryListState.isLoading ||
            categoryListState.isReloading) return;
        ref.read(provider.notifier).loadMore();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Блюда, категорий',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: const Color(0xFFFF6C29).withOpacity(0.1),
                  onTap: () {
                    showModalBottomSheet(
                      useRootNavigator: true,
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) => const AddCategoryDishSheet(),
                    );
                  },
                  child: Container(
                    height: 45,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xB2FF6C29)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xFFFF6C29),
                        ),
                        Gap(10),
                        Text(
                          'Добавить категорию',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF6C29),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                if (categoryListState.value != null)
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: categoryListState.value?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateCrossAxisCount(context, 115),
                      mainAxisExtent: 140,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (contex, i) {
                      final item = categoryListState.value![i];
                      return CategoryDishItem(
                        item: item,
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
