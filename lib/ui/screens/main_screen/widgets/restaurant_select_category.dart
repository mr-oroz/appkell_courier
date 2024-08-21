import 'package:appkel_for_courier_flutter/data/storage/local_storage.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/providers/restaurant_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/dialogs/moderation_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantSelectCategory extends HookConsumerWidget {
  const RestaurantSelectCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kitchensListProvider);
    final selectedIndexes = useState<Set<int>>({});
    final selectedIndex =
        ref.watch(restaurantProvidersProvider).selectedIndexCategory;
    final selectedCategoryName =
        ref.watch(restaurantProvidersProvider).selectedCategory;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(17),
            Image.asset('assets/images/app_logo.png'),
            const Gap(15),
            const Text(
              'Выберите тип кухни',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            state.when(
                data: (data) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...data.toSet().map(
                        (item) {
                          final index = data.indexOf(item);
                          final isSelected =
                              selectedIndexes.value.contains(item.id);
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(restaurantProvidersProvider.notifier)
                                  .onSelectedCategory(index, item.id);
                              if (isSelected) {
                                selectedIndexes.value =
                                    Set.from(selectedIndexes.value)
                                      ..remove(item.id);
                              } else {
                                selectedIndexes.value =
                                    Set.from(selectedIndexes.value)
                                      ..add(item.id!);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isSelected
                                          ? const Color(0xffFCC8B0)
                                          : Colors.white,
                                      border: Border.all(
                                        color: isSelected
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
                      )
                    ],
                  );
                },
                error: (error, stackTrace) => const SizedBox(),
                loading: () => const SizedBox()),
            const Gap(24),
            ElevatedButton(
                onPressed: () {
                  if (selectedCategoryName != null) {
                    ref.read(kitchensPostProvider(List.from(selectedIndexes.value))
                        .notifier);
                    LocalStorage()
                        .setBool('selected_category_restaurant', true);
                    Navigator.of(context).pop();

                    timerRestaurantSelected(context);
                  }
                },
                child: const Text('Подтвердить'))
            // Добавьте остальные виджеты, которые вы хотите отобразить в диалоговом окне
          ],
        ),
      ),
    );
  }
}
