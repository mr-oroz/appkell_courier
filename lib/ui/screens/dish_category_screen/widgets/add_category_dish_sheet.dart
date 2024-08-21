import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:appkel_for_courier_flutter/helpers/image_helper.dart';
import 'package:appkel_for_courier_flutter/hooks/use_form_key.dart';
import 'package:appkel_for_courier_flutter/providers/product_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_form_field.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/upload_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCategoryDishSheet extends HookConsumerWidget {
  const AddCategoryDishSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState<File?>(null);
    final formKey = useFormKey();
    final isLoading = useState(false);
    final categoryCtrl = useTextEditingController();
    final count = useState(0);
    final isButtonEnabled = useCallback(() {
      return categoryCtrl.text.isNotEmpty && image.value != null;
    }, []);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 15,
        right: 15,
      ),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Wrap(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 54,
                  height: 2,
                  color: const Color(0xFFD9D9D9),
                ),
              ),
              Container(margin: const EdgeInsets.only(top: 20)),
              const Text(
                'Создайте собственную категорию товара',
                style: TextStyle(
                  color: Color(0xFFFF6C29),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(margin: const EdgeInsets.only(bottom: 6)),
              CustomTextFormField(
                controller: categoryCtrl,
                radius: 15,
                color: const Color(0xFFFF6C29),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите Категория';
                  }
                  return null;
                },
                onChanged: (value) {
                  count.value++;
                },
                obscureText: false,
              ),
              if (image.value != null) ...[
                Container(margin: const EdgeInsets.only(top: 16)),
                UploadImageContainer(
                  color: const Color(0xFFFF6C29),
                  text: 'Файл загружен',
                  onTap: () async {
                    final photo =
                        await ImageHelper.pickImageFromSource(context);
                    image.value = photo;
                  },
                  fileName: image.value?.path.split('/').last,
                )
              ] else
                GestureDetector(
                  onTap: () async {
                    final file = await ImageHelper.pickImageFromSource(context);
                    image.value = file;
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xB2FF6C29)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xFFFF6C29)),
                        Gap(10),
                        Text(
                          'Добавить фото',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF6C29),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isButtonEnabled()
                          ? const Color(0xFFD9D9D9)
                          : Theme.of(context).primaryColor,
                    ),
                    child: !isLoading.value
                        ? const Text(
                            'Добавить позицию',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator.adaptive(),
                          ),
                    onPressed: () async {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid || isLoading.value) {
                        return;
                      }
                      isLoading.value = true;
                      final response = await ref.read(addCategoryDishProvider(
                              image: image.value!,
                              nameCategory: categoryCtrl.text)
                          .future);
                      if (!context.mounted) return;
                      if (response?.isSuccessful == true) {
                        Navigator.pop(
                          context,
                          MapEntry(image.value, categoryCtrl.text),
                        );
                        ref.refresh(categoryDishListProvider(search: null));
                        isLoading.value = false;
                        ();
                      } else {
                        Flushbar(
                          message: 'Произошла ошибка, попробуйте позже',
                          duration: const Duration(seconds: 3),
                          flushbarStyle: FlushbarStyle.GROUNDED,
                        ).show(context);
                        isLoading.value = false;
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
