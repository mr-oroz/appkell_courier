import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../hooks/use_form_key.dart';
import '../../providers/product_providers.dart';

class ProductPriceSheet extends HookConsumerWidget {
  const ProductPriceSheet(
    this.productId, {
    super.key,
  });
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final formKey = useFormKey();

    final isLoading = useState(false);
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
              height: 36,
              width: double.infinity,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Цена товара',
                style: TextStyle(
                  color: Color(0xFFA4A4A4),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите цену';
                  }
                  return null;
                },
                controller: controller,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(9),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Введите цену',
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
                final response = await ref.read(addPriceProvider(
                  productId: productId,
                  price: int.parse(controller.text),
                ).future);
                if (!context.mounted) return;
                if (response?.isSuccessful == true) {
                  isLoading.value = false;
                  Navigator.pop(
                    context,
                    controller.text.isNotEmpty ? controller.text : null,
                  );
                } else {
                  isLoading.value = false;

                  Flushbar(
                    message: 'Произошла ошибка при добавлении цены',
                    duration: const Duration(seconds: 3),
                    flushbarStyle: FlushbarStyle.GROUNDED,
                  ).show(context);
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
                        'Добавить цену',
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
              height: MediaQuery.of(context).viewInsets.bottom != 0 ? 20 : null,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
