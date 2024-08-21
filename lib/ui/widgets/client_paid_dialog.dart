import 'package:appkel_for_courier_flutter/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClientPaidDialog extends HookConsumerWidget {
  const ClientPaidDialog({
    super.key,
    required this.orderId,
    this.checkImage,
    this.paymentMethod = PaymentMethod.cash,
  });
  final int orderId;
  final String? checkImage;
  final PaymentMethod paymentMethod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowCheck = useState(false);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      alignment: Alignment.topCenter,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: double.infinity),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      text: 'Клиент',
                      children: [
                        TextSpan(
                          text: ' #$orderId',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (paymentMethod.isWallet)
                          const TextSpan(
                            text:
                                ' оплатил заказ\nСпособ оплаты - перевод на MBank',
                          )
                        else
                          const TextSpan(
                            text: ' оплатил заказ\nСпособ оплаты - наличные',
                          )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    isShowCheck.value = false;
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const Gap(16),
          if (paymentMethod.isCash)
            const SizedBox()
          else if (!isShowCheck.value) ...[
            GestureDetector(
              onTap: () {
                isShowCheck.value = true;
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 37,
                constraints: const BoxConstraints(
                  maxWidth: 170,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFF6C29),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Посмотреть Чек',
                  style: TextStyle(
                    color: Color(0xFFFF6C29),
                    fontSize: 15,
                    // fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const Gap(20),
          ] else ...[
            Image.network(checkImage!),
          ],
        ],
      ),
    );
  }
}
