import 'package:another_flushbar/flushbar.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../hooks/use_form_key.dart';

const intervalTime = [
  MapEntry(3, 'часа'),
  MapEntry(6, 'часов'),
  MapEntry(12, 'часов'),
  MapEntry(24, 'часа'),
];

class ProductDiscountSheet extends HookConsumerWidget {
  const ProductDiscountSheet(
    this.productId, {
    super.key,
  });

  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isLoading = useState(false);
    final selectedInterval = useState(3);
    final formKey = useFormKey();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 15,
        right: 15,
      ),
      child: SafeArea(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const SizedBox(
              height: 9,
              width: double.infinity,
            ),
            Container(
              width: 54,
              height: 3,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
              width: double.infinity,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      selectedInterval.value = intervalTime[index].key;
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: index == 3 ? 0 : 10),
                      height: 40,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            width: 1,
                            color: selectedInterval.value ==
                                    intervalTime[index].key
                                ? const Color(0xFFFF6C29)
                                : const Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${intervalTime[index].key} ${intervalTime[index].value}',
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 26,
              width: double.infinity,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Скидка на товар',
                style: TextStyle(
                  color: Color(0xFFA4A4A4),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите скидку на товар';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[DiscountInputFormatter()],
                decoration: const InputDecoration(
                  suffixText: '%',
                  filled: true,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF6C29),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  fillColor: Colors.transparent,
                  hintText: 'Введите скидку на товар',
                  hintStyle: TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                if (!formKey.currentState!.validate() || isLoading.value) {
                  return;
                }
                isLoading.value = true;
                final response = await ref.read(
                  addDiscountProvider(
                          discount: int.parse(controller.text),
                          id: productId,
                          intervalTime: selectedInterval.value)
                      .future,
                );
                if (!context.mounted) return;
                print(response?.statusCode);
                if (response?.isSuccessful == true) {
                  Navigator.pop(context,
                      MapEntry(selectedInterval.value, controller.text));
                  isLoading.value = false;
                } else if (response?.statusCode == 400) {
                  Flushbar(
                    message:
                        'Извините, вы можете установить скидку только один раз на один продукт\n'
                        'Следующую скидку вы сможете установить через 24 часа',
                    duration: const Duration(seconds: 3),
                    flushbarStyle: FlushbarStyle.GROUNDED,
                  ).show(context);
                  isLoading.value = false;
                } else {
                  Flushbar(
                    message: 'Произошла ошибка, попробуйте позже',
                    duration: const Duration(seconds: 3),
                    flushbarStyle: FlushbarStyle.GROUNDED,
                  ).show(context);

                  isLoading.value = false;
                }
              },
              child: Container(
                width: 363,
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
                        'Добавить скидку %',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).viewInsets.bottom != 10 ? 20 : null,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? discount = int.tryParse(newValue.text);

    if (discount != null && discount >= 0 && discount <= 100) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
