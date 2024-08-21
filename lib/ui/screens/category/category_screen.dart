import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helpers/cross_axis_count.dart';

import '../home/widgets/search_product_text_field.dart';

import 'widgets/category_item.dart';

class CategoryScreen extends HookConsumerWidget {
  const CategoryScreen({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = useState<String?>(null);
    final provider = useMemoized(
      () => categoryListProvider(search: searchText.value),
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
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          return ref.invalidate(provider);
        },
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const Gap(15),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Товары',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            const Gap(15),
            SearchProductTextField(
              onChanged: (value) {
                searchText.value = value;
              },
            ),
            const Gap(20),
            if (categoryListState.value != null)
              GridView.builder(
                shrinkWrap: true,
                itemCount: categoryListState.value!.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: calculateCrossAxisCount(context, 115),
                  // childAspectRatio: 175 / 205,
                  mainAxisExtent: 140,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (contex, i) {
                  final category = categoryListState.value![i];
                  return CategoryItem(category: category);
                },
              ),
            const Gap(50),
          ],
        ),
      )),
    );
  }
}
