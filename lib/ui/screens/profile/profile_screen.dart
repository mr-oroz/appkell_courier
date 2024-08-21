import 'package:appkel_for_courier_flutter/config/config.dart';
import 'package:appkel_for_courier_flutter/data/models/profile_model.dart';
import 'package:appkel_for_courier_flutter/helpers/formatter.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/content_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/custom_drop_down.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/product_tile_item_widget.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/requisite_widget.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/timer_text_field_widget.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/user_field_widget.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/preview_order_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../helpers/image_helper.dart';

import '../../../l10n/strings.dart';
import '../../../providers/my_order_providers.dart';
import '../../../providers/user_providers.dart';

import 'edit_user_profile_screen.dart';
import 'more_profile_screen.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Builder(builder: (context) {
      if (userState.status.isLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }
      if (userState.status.isError) {
        return const Center(
          child: Text('Что-то пошло не так. Попробуйте позже.'),
        );
      }
      if (userState.profile == null ) {
        return const SizedBox.shrink();
      }
      final profile = userState.profile!;
      return ProfilePage(
        profile: profile,
        role: userState.role,
      );
    });
  }
}

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({
    super.key,
    required this.profile,
    this.role,
  });
  final ProfileModel profile;
  final Role? role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveredOrders = ref.watch(deliveredOrdersProvider);
    final updateProfileMap = useState<Map<String, dynamic>>({});
    final timerCtrl = useTextEditingController(
        text: '${profile.workTimeFrom}-${profile.workTimeTo}');
        
    final fio = useTextEditingController(
      text: profile.fio,
    );
    final shopName = useTextEditingController(
      text: profile.shopName,
    );
    final phone = useTextEditingController(
      text: profile.phone,
    );
    final email = useTextEditingController(
      text: profile.email,
    );

    final totalSales = useTextEditingController(
      text: profile.totalSales?.toString(),
    );

    final scrollController = useScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (deliveredOrders.isRefreshing ||
            deliveredOrders.isLoading ||
            deliveredOrders.isReloading) return;
        ref.read(deliveredOrdersProvider.notifier).loadMore();
      }
    });
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          return ref.read(userProvider.notifier).profile();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          children: [
            const Gap(19),
            Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Профиль',
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (updateProfileMap.value.isNotEmpty) {
                        ref
                            .read(userProvider.notifier)
                            .updateProfile(updateProfileMap.value);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditUserProfile(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      updateProfileMap.value.isEmpty
                          ? 'Редактировать'
                          : 'Сохранить',
                      style: TextStyle(
                        color: updateProfileMap.value.isEmpty
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: profile.avatar != null
                        ? DecorationImage(
                            image: NetworkImage(
                              '${Constants.baseUrl}${profile.avatar}',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                          )
                        : const DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWvy5fPgUs-S1Y-cyqeRU79zPlZYnJrFKGBJlCA0_2WQ&s'),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
            const Gap(25),
            if (role != null)
              UserField(
                readOnly: true,
                hintText:
                    'Введите ${role == Role.courier ? 'ФИО' : 'компанию'}',
                controller: role == Role.courier ? fio : shopName,
                title: role == Role.courier ? 'ФИО' : 'Компания',
                onChanged: (value) {
                  updateProfileMap.value = {
                    ...updateProfileMap.value,
                    if (role == Role.courier)
                      'full_name': value
                    else
                      'shop_name': value,
                  };
                },
              ),

            UserField(
              readOnly: true,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.phone,
              controller: phone,
              title: 'Номер телефона',
              hintText: 'Введите номер телефона',
              onChanged: (value) {
                updateProfileMap.value = {
                  ...updateProfileMap.value,
                  'phone': value,
                };
              },
            ),
            if (profile.email != null)
              UserField(
                title: 'Почта',
                controller: email,
                readOnly: true,
              ),
            // if (profile.address != null)
            //   UserField(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const SelectLocationScreen(),
            //         ),
            //       );
            //     },
            //     readOnly: true,
            //     title: 'Адрес',
            //     controller: address,
            //     onChanged: (value) {
            //       updateProfileMap.value = {
            //         ...updateProfileMap.value,
            //         'address': value,
            //       };
            //     },
            //   ),
            if ((profile.totalSales != null && role?.isSalesman == true) ||
                (profile.totalSales != null && role?.isRestaurant == true))
              UserField(
                title: 'Общая сумма продаж',
                controller: totalSales,
                readOnly: true,
              ),
            if (role?.isSalesman == true || role?.isRestaurant == true)
              RequisiteWidget(
                requisites: profile.requisites,
              ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE5E5E5),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoreProfileScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Еще',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),

            if (role?.isRestaurant == true) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    //Flexible(
                    //  child: CustomDropDown(
                    //    onSelected: onSelected,
                    //    selectedValue: selectedCategoryValue.value,
                    //    items: categoryItems.value,
                    //  ),
                    //),
                    //const Gap(15),
                    Flexible(
                      child: TimerTextFieldWidget(controller: timerCtrl),
                    )
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFFF6C29)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcon(
                          AppIcons.camera,
                          color: Color(0xFFFF6C29),
                        ),
                        Gap(10),
                        Text(
                          'Добавить фото, видео',
                          style: TextStyle(
                            color: Color(0xFFFF6C29),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContentScreen(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
            const Gap(30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'История заказов',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            if (deliveredOrders.value?.isNotEmpty == true)
              ListView.builder(
                padding: const EdgeInsets.only(bottom: 35),
                itemCount: deliveredOrders.value!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = deliveredOrders.value![index];
                  final previousOperator =
                      index > 0 ? deliveredOrders.value![index - 1] : null;
                  if (previousOperator != null &&
                      order.date == previousOperator.date) {
                    GestureDetector(
                      onTap: () {
                        if (role == null) return;
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => PreviewOrder(
                            isShowPrice: false,
                            order: order,
                            role: role!,
                          ),
                        );
                      },
                      child: order.products.isNotEmpty
                          ? SizedBox(
                              height: 90,
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: order.products.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ProductTileItem(
                                    isShowPrice: false,
                                    cardWidth: 281,
                                    product: order.products[index],
                                  );
                                },
                              ),
                            )
                          : Text(
                              order.quickOrderText ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        if (role == null) return;
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => PreviewOrder(
                            isShowPrice: false,
                            order: order,
                            role: role!,
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 15,
                                  left: 15,
                                ),
                                child: Text(
                                  formatDate(
                                    order.date ?? DateTime.now(),
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xFFA4A4A4),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (order.products.isNotEmpty)
                            SizedBox(
                              height: 90,
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: order.products.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ProductTileItem(
                                    cardWidth: 281,
                                    isShowPrice: false,
                                    product: order.products[index],
                                  );
                                },
                              ),
                            )
                          else if (order.quickOrderText != null) ...[
                            const Gap(20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                order.quickOrderText!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ],
                      ),
                    );
                  }
                  return null;
                },
              )
            else ...[
              const Gap(30),
              Center(
                child: Text(
                  Strings.of(context).empty,
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),),
    );
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

String formatDate(DateTime date) {
  if (isSameDay(date, DateTime.now())) {
    return 'Сегодня';
  }

  return DateFormat('d MMMM yyyy', 'ru').format(date);
}
