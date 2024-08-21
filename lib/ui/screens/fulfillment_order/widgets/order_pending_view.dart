import 'package:appkel_for_courier_flutter/providers/order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class OrderPendingView extends HookConsumerWidget {
  const OrderPendingView({
    super.key,
    this.approximateAmount,
    this.onCookingComplete,
    required this.id,
  });

  final String? approximateAmount;
  final Function(String)? onCookingComplete;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCorrectApproximateAmount = useState(false);
    final exactAmountController = useTextEditingController();
    final isValid = useState(true);
    final isLoading = useState(false);
    return Column(
      children: [
        const Gap(26),
        Image.asset(
          'assets/images/timer_illustration.png',
          height: 207,
          width: 208,
        ),
        const Gap(53),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                isCorrectApproximateAmount.value =
                    !isCorrectApproximateAmount.value;
                if (isCorrectApproximateAmount.value) {
                  exactAmountController.text = approximateAmount ?? '0';
                } else {
                  exactAmountController.text = '';
                }
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: isCorrectApproximateAmount.value
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                        size: 17,
                      )
                    : null,
              ),
            ),
            
          ],
        ),
        const Gap(8),
        const Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 223,
            child: Text(
              'Если примерная сумма с приложения верная, нажмите на галочку',
              style: TextStyle(
                color: Color(0xFFA4A4A4),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        const Gap(30),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Точная сумма',
            style: TextStyle(
              color: Color(0xFFFF6C29),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(5),
        TextFormField(
          controller: exactAmountController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              isValid.value = true;
            } else {
              isValid.value = false;
            }
          },
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(9),
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: isValid.value ? null : 'Введите точную сумму',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFFF6C29),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFFF6C29),
                width: 1,
              ),
            ),
          ),
        ),
        const Gap(8),
        const Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 243,
            child: Text(
              'Если примерная сумма с приложения неверная, напишите сюда точную сумму',
              style: TextStyle(
                color: Color(0xFFA4A4A4),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
        const Gap(30),
        GestureDetector(
          onTap: () async {
            if (exactAmountController.text.isEmpty) {
              isValid.value = false;
            } else {
              isValid.value = true;
              isLoading.value = true;
              ref.read(orderDishDetailProvider(id).notifier).cookingComplete(
                    int.parse(exactAmountController.text),
                  );
              onCookingComplete?.call(exactAmountController.text);
            }
          },
          child: Container(
              height: 45,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6C29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              alignment: Alignment.center,
              child: !isLoading.value
                  ? const Text(
                      'Готовка завершена',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )),
        ),
      ],
    );
  }
}
