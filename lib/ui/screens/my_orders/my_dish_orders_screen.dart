import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:appkel_for_courier_flutter/data/models/profile_model.dart';
import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/fulfillment_dish_order_screen.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/preview_dish_order.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/my_order_providers.dart';
import '../../../providers/user_providers.dart';

class MyDishOrdersScreen extends HookConsumerWidget {
  const MyDishOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final myOrders = ref.watch(myDishOrderListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Мои заказы',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        
      ),
      
      body: ListView(
        children: [
          const Gap(33),
          SvgPicture.asset('assets/svg/loading_illustration.svg'),
          const Gap(20),
          const Center(
            child: Text(
              "Здесь будут ваши принятые запросы",
              style: TextStyle(
                color: Color(0xFFAEAEAE),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
          const Gap(50),
          myOrders.when(
            data: (orders) {
              if (orders.isEmpty) {
                return const Center(
                  child: Text('У вас нет заказов'),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return GestureDetector(
                    onTap: () async {
                      if (userState.role == null) return;
                      if (userState.role == Role.courier) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => PreviewDishOrder(
                            order: order,
                            role: userState.role!,
                            isHasAcceptRejectButton: true,
                            isShowDiscount: true,
                            isShowPrice: true,
                            warningAboutHasDiscount: true,
                          ),
                        );
                      } else if (userState.role == Role.restaurant) {
                        if (order.status == OrderDishStatus.delivered ||
                            order.status == OrderDishStatus.canceled ||
                            order.status == OrderDishStatus.canceledByClient ||
                            order.status == OrderDishStatus.canceledByShop) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => PreviewDishOrder(
                              isHasCourier: userState.isHasCourier,
                              order: order,
                              role: Role.restaurant,
                              isHasAcceptRejectButton: false,
                            ),
                          );
                        } else {
                          ref.watch(orderDishDetailProvider(order.id!));
                          await ref
                              .read(orderDishDetailProvider(order.id!).notifier)
                              .connectToSocket(order.id!);
                          ref
                              .read(orderDishDetailProvider(order.id!).notifier)
                              .getTimers();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FulfillmentDishOrderScreen(
                                id: order.id!,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0C1A1A1A),
                            blurRadius: 10,
                            offset: Offset(0, -2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: order.payCheck ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWvy5fPgUs-S1Y-cyqeRU79zPlZYnJrFKGBJlCA0_2WQ&s',
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Заказ #${order.id}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  getOrderStatus(order.status).toLowerCase(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFA5A5A5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFFF6C29),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            alignment: Alignment.center,
                            child: const Text(
                              'Смотреть',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Gap(10),
                itemCount: orders.length,
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) {
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  String getOrderStatus(OrderDishStatus status) {
    switch (status) {
      case OrderDishStatus.pending:
        return 'Ожидание';
      case OrderDishStatus.preparing:
        return 'Готовится';
      case OrderDishStatus.searchCourier:
        return 'Поиск курьера';
      case OrderDishStatus.paymentCheck:
        return 'Проверка оплаты';
      case OrderDishStatus.paymentPending:
        return 'Ожидание оплаты';
      case OrderDishStatus.sending:
        return 'Отправка';
      case OrderDishStatus.delivered:
        return 'Доставлен';
      case OrderDishStatus.canceled:
        return 'Отменен';
      case OrderDishStatus.canceledByClient:
        return 'Отменен клиентом';
      case OrderDishStatus.canceledByShop:
        return 'Отменен магазином';
      case OrderDishStatus.planned:
        return 'Запланирован';
      default:
        return '';
    }
  }
}
