import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:appkel_for_courier_flutter/ui/screens/fulfillment_order/fulfillment_order_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/main_screen.dart';

import 'package:appkel_for_courier_flutter/ui/widgets/order_buttons_widget.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/profile_model.dart';
import '../../providers/order_detail_provider.dart';
import '../../providers/order_providers.dart';
import '../screens/profile/widgets/product_tile_item_widget.dart';
import 'edit_product_bottom_sheet.dart';
import 'order_details_view.dart';

class PreviewOrder extends HookConsumerWidget {
  const PreviewOrder({
    super.key,
    required this.order,
    required this.role,
    this.isHasAcceptRejectButton = false,
    this.isHasCourier = false,
    this.isShowPrice = true,
    this.isShowDiscount = false,
    this.warningAboutHasDiscount = false,
  });

  final OrderModel order;
  final Role role;
  final bool isHasAcceptRejectButton;
  final bool isHasCourier;
  final bool isShowPrice;
  final bool isShowDiscount;
  final bool warningAboutHasDiscount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(orderDetailProvider(order.id), (prevState, nextState) {
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
          nextState.order?.status != OrderStatus.preparing) return;
      ref.read(orderDetailProvider(order.id).notifier).getTimers();
      final timers = nextState.timers;
      if (timers?.preparing != null &&
          timers?.paymentPending != null &&
          timers?.sending != null) return;
      ref.read(orderListProvider.notifier).deleteOrder(nextState.order!.id);
      if (role == Role.salesman) {
        Navigator.of(context)
          ..pop()
          ..push(
            MaterialPageRoute(
              builder: (context) => FulfillmentOrderScreen(
                id: nextState.order!.id,
              ),
            ),
          );
        if (order.quickOrderText == null) {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            backgroundColor: const Color(0xFFFFFFFF),
            isScrollControlled: true,
            builder: (context) => EditProductBottomSheet(
              order: order,
              onClose: () {
                Navigator.pop(context);
              },
            ),
          );
        }
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
      initialChildSize: role == Role.salesman ? 0.8 : 0.9,
      minChildSize: role == Role.salesman ? 0.7 : 0.6,
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
                OrderDetailsView(
                  role: role,
                  order: order,
                  isHasCourier: isHasCourier,
                  isShowPrice: isShowPrice,
                  warningAboutHasDiscount: warningAboutHasDiscount,
                ),
                const Gap(15),
                if (order.products.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      controller: controller,
                      physics: const ClampingScrollPhysics(),
                      itemCount: order.products.length + 1,
                      // shrinkWrap: true,
                      itemBuilder: (_, index) {
                        if (index == order.products.length) {
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
                                        .read(orderDetailProvider(order.id)
                                            .notifier)
                                        .connectToSocket(order.id);
                                  },
                                  onReject: () async {
                                    ref
                                        .read(orderListProvider.notifier)
                                        .rejectOrder(order.id);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                              if (!isShowPrice) ...[
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
                                            '${order.price.toStringAsFixed(2)} с',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(15),
                                      if (order.products.isNotEmpty)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Кол-во товаров',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${order.products.fold(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue +
                                                    element.quantity.toInt(),
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
                        return ProductTileItem(
                          isShowDiscount: isShowDiscount,
                          isShowPrice: isShowPrice,
                          product: order.products[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(20),
                    ),
                  )
                else if (order.quickOrderText != null) ...[
                  Text(
                    order.quickOrderText!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(20),
                  if (isHasAcceptRejectButton) ...[
                    OrderButtons(
                      onAccept: () async {
                        await ref
                            .read(orderDetailProvider(order.id).notifier)
                            .connectToSocket(order.id);
                      },
                      onReject: () async {
                        ref
                            .read(orderListProvider.notifier)
                            .rejectOrder(order.id);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
