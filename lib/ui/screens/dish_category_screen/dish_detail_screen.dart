import 'package:appkel_for_courier_flutter/helpers/cross_axis_count.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/dish_category_screen/widgets/dish_create_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/screens/dish_category_screen/widgets/dish_product_detail_sheet.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DishDetailScreen extends HookConsumerWidget {
  const DishDetailScreen(this.nameCategory, this.categoryId, {super.key});

  final String nameCategory;
  final int categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products =
        ref.watch(dishProductsListProvider(categoryId: categoryId));

    final scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (products.isRefreshing || products.isLoading || products.isReloading)
          return;
        ref.read(dishProductsListProvider().notifier).loadMore();
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const AppIcon(AppIcons.arrow_down),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          nameCategory,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(
            top: 15,
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: const Color(0xFFFF6C29).withOpacity(0.1),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (context) => const AddDishProductSheet(),
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
                        Icon(Icons.add_circle_outline,
                            color: Color(0xFFFF6C29)),
                        Gap(10),
                        Text(
                          'Добавить блюдо',
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
              ),
              const SliverToBoxAdapter(child: Gap(20)),
              SliverFillRemaining(
                child: products.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('Блюда не найдены'),
                      );
                    }
                    return GridView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: products.value!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: calculateCrossAxisCount(context, 176),
                        mainAxisExtent: 281,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 13,
                      ),
                      itemBuilder: (context, index) {
                        final product = products.value![index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => DishProductDetailSheet(
                                product: product,
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 176,
                                width: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFFF1F1F1),
                                  image: product.images!.isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(
                                            product.images!.first.image ?? '',
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                alignment: Alignment.topRight,
                                child: const SizedBox(),
                              ),
                              const Gap(11),
                              if (product.title != null)
                                Text(
                                  product.title!,
                                  style: const TextStyle(
                                    color: Color(0xFF434343),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              const Gap(3),
                              if (product.calories != null)
                                Text(
                                  '${product.calories} г',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFFA4A4A4),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                  maxLines: 2,
                                ),
                              const Gap(7),
                              if (product.price != null)
                                Container(
                                  constraints: const BoxConstraints(
                                    minWidth: 90,
                                  ),
                                  height: 31,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF7F7F7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${product.price}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Color(0xFFFF6C29),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                      const Gap(6),
                                      const Icon(
                                        Icons.add,
                                        size: 14,
                                        color: Color(0xFFFF6C29),
                                      )
                                    ],
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  error: (e, error) => const Text('Что-то пошло не так'),
                  loading: () => const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
