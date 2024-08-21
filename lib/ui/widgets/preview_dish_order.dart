import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/fulfillment_dish_order_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/main_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/dish_tile_item_widget.dart';

import 'package:appkel_for_courier_flutter/ui/widgets/order_buttons_widget.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/order_details_dish_view.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/profile_model.dart';
import '../../providers/order_detail_provider.dart';
import '../../providers/order_providers.dart';

class PreviewDishOrder extends HookConsumerWidget {
  const PreviewDishOrder({
    super.key,
    required this.order,
    required this.role,
    this.isHasAcceptRejectButton = false,
    this.isHasCourier = false,
    this.isShowPrice = true,
    this.isShowDiscount = false,
    this.warningAboutHasDiscount = false,
  });

  final OrderDishModel order;
  final Role role;
  final bool isHasAcceptRejectButton;
  final bool isHasCourier;
  final bool isShowPrice;
  final bool isShowDiscount;
  final bool warningAboutHasDiscount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(orderDishDetailProvider(order.id!));
    ref.listen(orderDishDetailProvider(order.id!), (prevState, nextState) {
      if (nextState.isClosed == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Извините, заказ забрали раньше вас.'),
            ),
          );
          Navigator.pop(context);
        });
      }
      if (nextState.order == null &&
          nextState.order?.status != OrderDishStatus.preparing) return;
      ref.read(orderDishDetailProvider(order.id!).notifier).getTimers();
      final timers = nextState.timers;
      if (timers?.preparing != null &&
          timers?.courierSendingTimer != null &&
          timers?.sendingSettings != null) return;
      ref
          .read(orderDishListProvider.notifier)
          .deleteOrder(nextState.order!.id!);
      if (role == Role.restaurant || role == Role.courier) {
        Navigator.of(context)
          ..pop()
          ..push(
            MaterialPageRoute(
              builder: (context) => FulfillmentDishOrderScreen(
                id: nextState.order!.id!,
              ),
            ),
          );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (_) {
            return false;
          },
        );
      }
    });

    return DraggableScrollableSheet(
      initialChildSize: role == Role.restaurant ? 0.8 : 0.9,
      minChildSize: role == Role.restaurant ? 0.7 : 0.6,
      maxChildSize: 1,
      expand: false,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(9),
                OrderDetailsDishView(
                  role: role,
                  order: order,
                  isHasCourier: isHasCourier,
                  isShowPrice: isShowPrice,
                  warningAboutHasDiscount: warningAboutHasDiscount,
                ),
                const Gap(15),
                if (order.dishes.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      controller: controller,
                      physics: const ClampingScrollPhysics(),
                      itemCount: order.dishes.length + 1,
                      // shrinkWrap: true,
                      itemBuilder: (_, index) {
                        if (index == order.dishes.length) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFFF0F0F0),
                                    ),
                                  ),
                                ),
                              ),
                              if (isHasAcceptRejectButton) ...[
                                const Gap(30),
                                OrderButtons(
                                  onAccept: () async {
                                    await ref
                                        .read(orderDishDetailProvider(order.id!)
                                            .notifier)
                                        .connectToSocket(order.id!);
                                  },
                                  onReject: () async {
                                    ref
                                        .read(orderDishListProvider.notifier)
                                        .rejectOrder(order.id!);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                              if (!isShowPrice || role == Role.restaurant) ...[
                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 31,
                                    top: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 15,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Итого',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '${order.price!.toStringAsFixed(2)} с',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(15),
                                      if (order.dishes.isNotEmpty)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Кол-во блод',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${order.dishes.fold(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue +
                                                    element.quantity!.toInt(),
                                              )} шт',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          );
                        }

                        return DishtTileItem(
                          isShowDiscount: isShowDiscount,
                          isShowPrice: isShowPrice,
                          product: order.dishes[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(20),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
