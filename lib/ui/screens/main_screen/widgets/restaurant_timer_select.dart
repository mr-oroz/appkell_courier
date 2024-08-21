import 'package:appkel_for_courier_flutter/data/storage/local_storage.dart';
import 'package:appkel_for_courier_flutter/helpers/formatter.dart';
import 'package:appkel_for_courier_flutter/hooks/use_form_key.dart';
import 'package:appkel_for_courier_flutter/providers/user_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantTimerSelect extends HookConsumerWidget {
  const RestaurantTimerSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openCtrl = useTextEditingController();
    final closeCtrl = useTextEditingController();
    final formkey = useFormKey();
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(17),
              Image.asset('assets/images/app_logo.png'),
              const Gap(15),
              const Text(
                'Укажите время работы ресторана',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Text(
                          'Открытия:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(
                              0xff222222,
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        width: 120,
                        child: CustomTextFormField(
                          controller: openCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Введите Открытия';
                            }
                            return null;
                          },
                          center: TextAlign.center,
                          keyboardType: TextInputType.number,
                          hintText: '08:00',
                          inputFormatters: [timerFormatter],
                          radius: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Text(
                          'Закрытия:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(
                              0xff222222,
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        width: 120,
                        child: CustomTextFormField(
                          controller: closeCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Введите Закрытия';
                            }
                            return null;
                          },
                          center: TextAlign.center,
                          keyboardType: TextInputType.number,
                          hintText: '23:00',
                          inputFormatters: [timerFormatter],
                          radius: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(24),
              ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate() &&
                        openCtrl.text.isNotEmpty &&
                        closeCtrl.text.isNotEmpty) {
                      ref.read(userProvider.notifier).updateProfile({
                        "work_time_from": openCtrl.text,
                        "work_time_to": closeCtrl.text,
                      });
                      LocalStorage().setBool('selected_restaurant_timer', true);
                      Navigator.of(context).pop();
                    } else {
                      print('error');
                    }
                  },
                  child: const Text('Подтвердить'))
            ],
          ),
        ),
      ),
    );
  }
}
