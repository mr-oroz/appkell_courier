import 'package:appkel_for_courier_flutter/providers/auth_providers.dart';
import 'package:appkel_for_courier_flutter/providers/notification_providers.dart';
import 'package:appkel_for_courier_flutter/providers/order_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/home/widgets/order_dish_item_container.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/dialogs/moderation_confirmation_dialog.dart';

import 'package:appkel_for_courier_flutter/ui/screens/products/products_screen.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import '../../../data/models/profile_model.dart';
import '../../../helpers/cross_axis_count.dart';
import '../../../providers/product_providers.dart';
import '../../../providers/user_providers.dart';
import '../category/widgets/category_item.dart';
import '../main_screen/main_screen.dart';
import 'widgets/empty_order_list_container.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/order_item_container.dart';
import 'widgets/search_product_text_field.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final isHasCourier = useState(userState.isHasCourier);
    final orderListState = ref.watch(orderListProvider);
    final orderDishListState = ref.watch(orderDishListProvider);
    final unreadNotificationCount = ref.watch(unreadNotificationCountProvider);
    final searchText = useState<String?>(null);

    final provider = useMemoized(
      () => categoryListProvider(search: searchText.value),
      [searchText.value],
    );

    final categoryList = ref.watch(provider);

    ref.listen(userProvider, (prevState, nextState) {
      if (nextState.profile?.isWorked ?? false) {
        if (nextState.role == Role.courier) {
          //ref
          //    .read(orderDishListProvider.notifier)
          //    .connectToSocket((42.833673, 74.601936));
          getLocation().then((value) {
            if (value != null) {
              ref.read(orderListProvider.notifier).connectToSocket(
                (value.lat, value.lon),
              );
              ref.read(orderDishListProvider.notifier).connectToSocket(
                (value.lat, value.lon),
              );
            }
          });
        } else {
          if (userState.role == Role.salesman) {
            ref.read(orderListProvider.notifier).connectToSocket(null);
          }
          if (userState.role == Role.restaurant) {
            ref.read(orderDishListProvider.notifier).connectToSocket(null);
          }
        }
      }
    });

    return Scaffold(
      appBar: HomeAppBar(
        role: userState.role,
        latitude: userState.profile?.latitude,
        longitude: userState.profile?.longitude,
        unreadCount: unreadNotificationCount.value,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.read(userProvider.notifier).profile();
            ref.refresh(unreadNotificationCountProvider);
            if (userState.role == Role.restaurant ||
                userState.role == Role.courier) {
              ref.read(orderDishListProvider.notifier).refreshData();
            }
            if (userState.role == Role.salesman ||
                userState.role == Role.courier) {
              ref.read(orderListProvider.notifier).refreshData();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                if (userState.role == Role.salesman) ...[
                  const Gap(10),
                  SearchProductTextField(
                    onChanged: (value) {
                      searchText.value = value;
                    },
                  ),
                  if (categoryList.value != null &&
                      searchText.value?.isNotEmpty == true) ...[
                    const Gap(20),
                    if (categoryList.value!.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: categoryList.value!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: calculateCrossAxisCount(context, 115),
                          mainAxisExtent: 140,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (contex, i) {
                          final category = categoryList.value![i];
                          return CategoryItem(category: category);
                        },
                      )
                    else
                      const Text(
                        'Категории не найдены',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                  ],
                  const Gap(83),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductsScreen(
                                isMyProducts: true,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 179,
                          height: 86,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0C1A1A1A),
                                blurRadius: 10,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIcon(
                                AppIcons.my_products,
                                color: Theme.of(context).primaryColor,
                              ),
                              const Gap(10),
                              const Text(
                                'Мои товары',
                                style: TextStyle(
                                  color: Color(0xFFFF6C29),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(56),
                ] else ...[
                  const Gap(42),
                ],

                if (userState.role == Role.courier ||
                    userState.role == Role.salesman) ...[
                  Text(
                    userState.role == Role.courier
                        ? "Заказы с магазином"
                        : 'Заказы',
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(15),
                  if (orderListState.value != null)
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: orderListState.value!.length + 1,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: calculateCrossAxisCount(context, 176),
                        // childAspectRatio: 175 / 205,
                        mainAxisExtent:
                            userState.role == Role.salesman ? 205 : 190,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (contex, i) {
                        if (i == orderListState.value!.length ||
                            i == orderListState.value!.length + 1) {
                          return const EmptyOrderListContainer();
                        } else {
                          return OrderItemContainer(
                            order: orderListState.value![i],
                            isHasCourier: isHasCourier.value,
                          );
                        }
                      },
                    )
                ],
                const Gap(15),
                if (userState.role == Role.courier ||
                    userState.role == Role.restaurant) ...[
                  Text(
                    userState.role == Role.courier
                        ? "Заказы с рестаронов"
                        : 'Заказы',
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (orderDishListState.value != null)
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: orderDishListState.value!.length + 1,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: calculateCrossAxisCount(context, 176),
                        // childAspectRatio: 175 / 205,
                        mainAxisExtent:
                            userState.role == Role.restaurant ? 205 : 190,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (contex, i) {
                        if (i == orderDishListState.value!.length ||
                            i == orderDishListState.value!.length + 1) {
                          return const EmptyOrderListContainer();
                        } else {
                          return OrderDishItemContainer(
                            order: orderDishListState.value![i],
                            isHasCourier: isHasCourier.value,
                          );
                        }
                      },
                    ),
                ],
                const Gap(30),
                if (userState.profile != null)
                  GestureDetector(
                    onTap: () async {
                      if (userState.profile?.latitude == null &&
                          userState.profile != null &&
                          (userState.role == Role.salesman ||
                              userState.role == Role.restaurant)) {
                        await warningAboutSelectLocation(context, ref);
                        return;
                      }
                      await ref.read(userProvider.notifier).updateProfile({
                        'is_worked':
                            userState.profile?.isWorked == true ? false : true,
                      });
                      if (userState.role == Role.salesman ||
                          userState.role == Role.courier) {
                        if (userState.profile?.isWorked == true) {
                          ref.read(orderListProvider.notifier).close();
                        }
                      }
                      if (userState.role == Role.restaurant ||
                          userState.role == Role.courier) {
                        if (userState.profile?.isWorked == true) {
                          ref.read(orderDishListProvider.notifier).close();
                        }
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: userState.profile?.isWorked == true
                            ? const Color(0xFFFF6C29)
                            : const Color(0xFF034638),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        userState.profile?.isWorked == true
                            ? 'Завершить работу'
                            : 'Начать работу',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                // if (userState.role == Role.salesman) ...[
                //   const Gap(10),
                //   GestureDetector(
                //     onTap: () {
                //       isHasCourier.value = !isHasCourier.value;
                //       ref
                //           .read(userProvider.notifier)
                //           .setHasCourier(isHasCourier.value);
                //     },
                //     child: Container(
                //       height: 45,
                //       decoration: BoxDecoration(
                //         color: isHasCourier.value
                //             ? const Color(0xFFFF6C29)
                //             : const Color(0xFFE5E5E5),
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       alignment: Alignment.center,
                //       child: Text(
                //         'Свой курьер',
                //         style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w700,
                //           color: isHasCourier.value
                //               ? Colors.white
                //               : const Color.fromARGB(255, 68, 68, 68),
                //         ),
                //       ),
                //     ),
                //   ),
                // ],
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<({double lat, double lon})?> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();
    return (
      lat: locationData.latitude!,
      lon: locationData.longitude!,
    );
  }
}
