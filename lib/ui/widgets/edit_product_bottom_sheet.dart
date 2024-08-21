import 'package:appkel_for_courier_flutter/providers/my_order_providers.dart';
import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/order_item_update_model.dart';
import '../../data/models/order_model.dart';
import "package:appkel_for_courier_flutter/ui/widgets/editable_product.dart";

class EditProductBottomSheet extends HookConsumerWidget {
  const EditProductBottomSheet({
    super.key,
    required this.order,
    this.onClose,
  });

  final OrderModel order;
  final Function()? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = useState(order.products);

    final isLoading = useState(false);
    final updatedOrderModels = useState<List<OrderItemUpdateModel>>([]);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 15,
        right: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(9),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 54,
                    height: 6,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const AppIcon(AppIcons.cancel),
                  ),
                ),
              ],
            ),
            Text(
              'Заказ #${order.id}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(10),
            RichText(
              text: const TextSpan(
                text: 'Редактирование киллограммовки\n',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFF6C29),
                ),
                children: [
                  TextSpan(
                    text:
                        'Напишите сколько киллограмм или  грамм у вас получилось',
                    style: TextStyle(
                      color: Color(0xFFAEAEAE),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(22),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final order = products.value[index];
                return EditableProduct(
                  order,
                  onProductChanged: (quantity) {
                    final updatedOrderModel = OrderItemUpdateModel(
                      id: order.id,
                      weight: quantity,
                    );
                    if (updatedOrderModels.value
                        .any((element) => element.id == order.id)) {
                      updatedOrderModels.value = updatedOrderModels.value
                          .map((e) => e.id == order.id ? updatedOrderModel : e)
                          .toList();
                    } else {
                      updatedOrderModels.value.add(updatedOrderModel);
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: const Color(0xFFF0F0F0),
                margin: const EdgeInsets.only(top: 15, bottom: 10),
              ),
              itemCount: products.value.length,
            ),
            const Gap(28),
            GestureDetector(
              onTap: () async {
                if (updatedOrderModels.value.isNotEmpty) {
                  isLoading.value = true;
                  ref
                      .read(orderDetailProvider(order.id).notifier)
                      .updateWeight(updatedOrderModels.value);
                  isLoading.value = false;
                }

                onClose?.call();
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: ShapeDecoration(
                  color: isLoading.value
                      ? const Color(0xFFD9D9D9)
                      : const Color(0xFFFF6C29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                alignment: Alignment.center,
                child: isLoading.value
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator.adaptive())
                    : const Text(
                        'Готово',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
