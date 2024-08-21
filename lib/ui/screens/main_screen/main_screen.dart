import 'dart:async';

import 'package:appkel_for_courier_flutter/data/models/profile_model.dart';
import 'package:appkel_for_courier_flutter/data/storage/local_storage.dart';

import 'package:appkel_for_courier_flutter/providers/user_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/dish_category_screen/dish_category_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/category/category_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/my_orders/my_dish_orders_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/my_orders/my_orders_courier_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/my_orders/my_orders_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/profile_screen.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/models/product_model.dart';
import '../add_shop_information/add_shop_information_screen.dart';
import '../address_information/select_location_screen.dart';
import '../home/home_screen.dart';
import 'dialogs/moderation_confirmation_dialog.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key, this.pageIndex = 0}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(pageIndex);
    final userState = ref.watch(userProvider);
    final isFirst = useState(true);

    List<Widget> screens = [
      const HomeScreen(),
      if (userState.role == Role.salesman) const MyOrdersScreen(),
      if (userState.role == Role.restaurant) const MyDishOrdersScreen(),
      if (userState.role == Role.courier) const MyOrdersCourierScreen(),
      if (userState.role == Role.salesman) const CategoryScreen(),
      if (userState.role == Role.restaurant) const DishCategoryScreen(),
      const ProfileScreen(),
    ];

    useEffect(() {
      if (isFirst.value == false) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (userState.profile == null) return;
        if (userState.profile!.role.isCourier == true) return;
        bool check = LocalStorage().getBool('moderation_success') ?? false;

        if (userState.profile?.moderationConfirmationStatus.isPending == true) {
          if (userState.profile!.isHasShopInfo == false) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AddShopInformationScreen(),
              ),
              (_) {
                return false;
              },
            );
            return;
          }
          moderationConfirmationPending(context);
        } else if (userState.profile?.moderationConfirmationStatus.isApproved ==
            true) {
          if (!check) {
            moderationConfirmationSuccess(
                context, userState.profile!.shopName.toString());
          }
        } else if (userState.profile?.moderationConfirmationStatus.isRejected ==
            true) {
          moderationConfirmationRejected(context);
        } else if (userState.profile != null &&
                userState.profile?.latitude == null &&
                (userState.role == Role.salesman) ||
            (userState.role == Role.restaurant)) {
          warningAboutSelectLocation(context, ref);
        } else if (userState.profile!.isHasShopInfo == false) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const AddShopInformationScreen(),
            ),
            (_) {
              return false;
            },
          );
        }
        isFirst.value = false;
      });
      return null;
    }, [userState]);

    bool isCheckCourier = userState.role == Role.courier;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 103,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0C1A1A1A),
              blurRadius: 10,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Material(
                child: InkWell(
                  onTap: () => currentIndex.value = 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(
                        AppIcons.home,
                        color: currentIndex.value == 0
                            ? Theme.of(context).primaryColor
                            : const Color(0xFFAEAEAE),
                      ),
                      const Gap(3),
                      Text(
                        'Главная',
                        style: TextStyle(
                          color: currentIndex.value == 0
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFAEAEAE),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                child: InkWell(
                  onTap: () => currentIndex.value = 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(
                        AppIcons.bag_tick,
                        color: currentIndex.value == 1
                            ? Theme.of(context).primaryColor
                            : const Color(0xFFAEAEAE),
                      ),
                      const Gap(3),
                      Text(
                        'Мои заказы',
                        style: TextStyle(
                          color: currentIndex.value == 1
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFAEAEAE),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (userState.role == Role.salesman ||
                userState.role == Role.restaurant) ...[
              Expanded(
                child: Material(
                  child: InkWell(
                    onTap: () => currentIndex.value = 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon(
                          AppIcons.element_equal,
                          color: currentIndex.value == 2
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFAEAEAE),
                        ),
                        const Gap(3),
                        Text(
                          userState.role == Role.restaurant
                              ? 'Блюда'
                              : 'Товары',
                          style: TextStyle(
                            color: currentIndex.value == 2
                                ? Theme.of(context).primaryColor
                                : const Color(0xFFAEAEAE),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            if (isCheckCourier)
              Expanded(
                child: Material(
                  child: InkWell(
                    onTap: () => currentIndex.value = 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon(
                          AppIcons.user,
                          color: currentIndex.value == 2
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFAEAEAE),
                        ),
                        const Gap(3),
                        Text(
                          'Профиль',
                          style: TextStyle(
                            color: currentIndex.value == 2
                                ? Theme.of(context).primaryColor
                                : const Color(0xFFAEAEAE),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Material(
                  child: InkWell(
                    onTap: () => currentIndex.value = 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon(
                          AppIcons.user,
                          color: currentIndex.value == 3
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFAEAEAE),
                        ),
                        const Gap(3),
                        Text(
                          'Профиль',
                          style: TextStyle(
                            color: currentIndex.value == 3
                                ? Theme.of(context).primaryColor
                                : const Color(0xFFAEAEAE),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

String getUnit(Unit unit) {
  switch (unit) {
    case Unit.gram:
      return 'г';
    case Unit.liter:
      return 'л';
    case Unit.kg:
      return 'кг';
    case Unit.st:
      return 'шт';
    default:
      return '';
  }
}

Future<dynamic> warningAboutSelectLocation(
    BuildContext context, WidgetRef ref) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AppIcon(AppIcons.address_illustration),
              ),
              const Gap(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const Text(
                      'Для использования приложения, заполните поле “основной адрес” в личном кабинете, чтобы клиенты могли вам посылать запросы',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(25),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context)
                          ..pop()
                          ..push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SelectLocationScreen(),
                            ),
                          );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 35,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF6C29),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Перейти',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Добавьте остальные виджеты, которые вы хотите отобразить в диалоговом окне
            ],
          ),
        ),
      );
    },
  );
}
