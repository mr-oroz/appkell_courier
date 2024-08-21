import 'package:appkel_for_courier_flutter/data/storage/local_storage.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/providers/restaurant_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/dialogs/moderation_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestauranRadiusSelect extends HookConsumerWidget {
  const RestauranRadiusSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantProvidersProvider);
    final radius = ref.watch(radiusListProvider);
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
              'Выберите радиус действия уведомлений от полученных заказов',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            radius.when(
              data: (data) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...data.map((item) {
                      final index = data.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(restaurantProvidersProvider.notifier)
                              .onSelected(index, item.radius!);
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Радиус в ${item.radius} км',
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
                                  color: state.selectedIndex == index
                                      ? const Color(0xffFCC8B0)
                                      : Colors.white,
                                  border: Border.all(
                                    color: state.selectedIndex == index
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
                    })
                  ],
                );
              },
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const SizedBox(),
            ),
            const Gap(24),
            ElevatedButton(
                onPressed: () {
                  if (state.selectedRadius != null) {
                    ref.read(radiusPostProvider(radius: state.selectedRadius!));
                    LocalStorage().setBool('selected_radius', true);
                    Navigator.of(context).pop();
                    categoryRestaurantSelected(context);
                  } else {
                    print('error');
                  }
                },
                child: const Text('Подтвердить'))
          ],
        ),
      ),
    );
  }
}
