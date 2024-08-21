import 'package:appkel_for_courier_flutter/providers/product_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helpers/cross_axis_count.dart';
import '../../widgets/product_details_sheet.dart';
import '../home/widgets/search_product_text_field.dart';
import '../profile/widgets/product_tile_item_widget.dart';
import 'widgets/discount_card.dart';

class ProductsScreen extends HookConsumerWidget {
  const ProductsScreen({
    super.key,
    this.appBarTitleText,
    this.categoryId,
    this.isMyProducts = false,
  });

  final String? appBarTitleText;
  final int? categoryId;
  final bool? isMyProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = useState<String?>(null);

    final provider = useMemoized(
      () => productsListProvider(
          categoryId: categoryId, search: searchText.value),
      [searchText.value],
    );
    final productsListState = ref.watch(provider);

    final scrollController = useScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
        if (productsListState.isRefreshing ||
            productsListState.isLoading ||
            productsListState.isReloading) return;

        ref.read(provider.notifier).loadMore();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitleText ?? 'Товары',
          style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            return ref
                .refresh(productsListProvider(categoryId: categoryId).future);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SearchProductTextField(
                        onChanged: (value) {
                          searchText.value = value;
                        },
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: productsListState.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('Товары не найдены'),
                      );
                    }
                    return GridView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: productsListState.value!.length,
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: calculateCrossAxisCount(context, 176),
                        // childAspectRatio: 175 / 205,
                        mainAxisExtent: 281,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (contex, i) {
                        final product = productsListState.value![i];

                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  ProductDetailsSheet(model: product),
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
                                  image: product.images.isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(
                                            product.images.first,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                alignment: Alignment.topRight,
                                child: product.price?.discount != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: DiscountCard(
                                          discount: product.price!.discount!,
                                        ),
                                      )
                                    : const SizedBox(),
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
                              const Gap(5),
                              if (product.weight != null)
                                Text(
                                  product.weight!.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFFA4A4A4),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              const Gap(5),
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
                                      if (product.price?.discount != null)
                                        Text(
                                          '${product.price!.oldPrice.toStringAsFixed(2)} c',
                                          style: const TextStyle(
                                            color: Color(0xFFA4A4A4),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Color(0xFFA4A4A4),
                                          ),
                                        ),
                                      const Gap(10),
                                      Text(
                                        getPrice(
                                            product.price!.price,
                                            product.price!.oldPrice,
                                            product.price!.discount),
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
                              // else
                              //   const Text(
                              //     '0',
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //       color: Color(0xFFFF0000),
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w700,
                              //     ),
                              //   ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
