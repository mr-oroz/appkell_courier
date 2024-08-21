

import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/home/widgets/search_product_text_field.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttachThePlatter extends HookConsumerWidget {
  const AttachThePlatter({super.key, required this.onSelected});

  final Function(String id) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(dishProductsListProvider());
    final selectedIndex = useState<int>(0);

    void onTap(String id, int index) {
      onSelected(id);
      selectedIndex.value = index;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            SearchProductTextField(
              onChanged: (value) {},
            ),
            const Gap(15),
            Expanded(
              flex: 10,
              child: products.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      final item = data[index];
                      return GestureDetector(
                        onTap: () => onTap(item.id.toString(), index),
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              if (item.images != null &&
                                  item.images!.isNotEmpty)
                                CachedImage(
                                  imageUrl: item.images!.first.image,
                                  width: 51,
                                  height: 51,
                                  fit: BoxFit.cover,
                                ),
                              const SizedBox(width: 10),
                              Expanded(child: Text(item.title ?? 'No title')),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedIndex.value == index
                                      ? const Color(0xffFCC8B0)
                                      : Colors.white,
                                  border: Border.all(
                                    color: selectedIndex.value == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF6C29),
                  ),
                  child: const Text(
                    'Прикрепить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
