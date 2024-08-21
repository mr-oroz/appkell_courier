import 'package:appkel_for_courier_flutter/ui/screens/auth/confirmation_code/confirmation_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helpers/formatter.dart';
import '../../../../hooks/use_form_key.dart';
import '../../../../providers/auth_providers.dart';
import '../../../widgets/app_icon.dart';
import '../registration/widgets/custom_text_form_field.dart';
import '../widgets/change_type_register.dart';

class HasPhoneNumberScreen extends HookConsumerWidget {
  const HasPhoneNumberScreen({
    super.key,
    this.phoneSelected = true,
  });

  final bool phoneSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);

    final emailTextController = useTextEditingController();
    final phoneTextController = useTextEditingController();
    final authState = ref.watch(authProvider);
    final isSelectedPhone = useState(phoneSelected);
    final formKey = useFormKey();

    ref.listen(
      authProvider,
      (prevState, nextState) {
        if (nextState.status.isSuccess) {
          String? loginText;
          if (isSelectedPhone.value) {
            loginText = phoneTextController.text
                .replaceAll('+', '')
                .replaceAll(' ', '');
          } else {
            loginText = emailTextController.text;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmationCodeScreen(
                login: isSelectedPhone.value
                    ? phoneTextController.text
                    : emailTextController.text,
                isSelectedPhone: isSelectedPhone.value,
                isRecoveryPassword: true,
              ),
            ),
          );
        }
        if (nextState.status.isHasNotPhoneNumber) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                nextState.errorText!,
              ),
            ),
          );
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(21),
                  Stack(
                    children: [
                      const Center(
                        child: Text(
                          'Восстановление пароля',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const AppIcon(AppIcons.arrow_down),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 430),
                      child: Column(
                        children: [
                          const Text(
                            'Введите свой телефон или почту, которые указывали при регистрации',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF727272),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(124),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ChangeTypeRegister(
                              sendType: isSelectedPhone.value ? 2 : 1,
                              onSendTypeChanged: (newSendType) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                isSelectedPhone.value = newSendType == 2;
                              },
                            ),
                          ),
                          const Gap(10),
                          if (isSelectedPhone.value) ...[
                            CustomTextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                phoneFormatter,
                              ],
                              hintText: 'Ваш номер телефона',
                              controller: phoneTextController,
                              prefixIcon: AppIcons.call,
                              validator: (value) {
                                if (value!.isEmpty && isSelectedPhone.value) {
                                  return 'Введите номер телефона';
                                }
                                if (value.length != 16) {
                                  return 'Номер телефона должен содержать 12 цифр';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                count.value++;
                              },
                            )
                          ] else ...[
                            CustomTextFormField(
                              hintText: 'Почта',
                              controller: emailTextController,
                              prefixIcon: AppIcons.sms,
                              validator: (value) {
                                if (value!.isEmpty && !isSelectedPhone.value) {
                                  return 'Введите почту';
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Введите корректную почту';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                count.value++;
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid) {
                        return;
                      }
                      if (authState.status.isLoading ||
                          (isSelectedPhone.value
                                  ? phoneTextController.text
                                  : emailTextController.text)
                              .isEmpty) {
                        return;
                      }

                      ref.read(authProvider.notifier).sendCode(
                          isSelectedPhone.value
                              ? phoneTextController.text
                                  .replaceAll('+', '')
                                  .replaceAll(' ', '')
                                  .replaceAll('(', '')
                                  .replaceAll(')', '')
                                  .replaceAll('-', '')
                              : null,
                          !isSelectedPhone.value
                              ? emailTextController.text
                              : null);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: authState.status.isLoading ||
                                (isSelectedPhone.value
                                        ? phoneTextController.text
                                        : emailTextController.text)
                                    .isEmpty
                            ? const Color(0xFFD9D9D9)
                            : Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: !authState.status.isLoading
                          ? const Text(
                              'Отправить SMS код',
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
                              child: CircularProgressIndicator.adaptive(),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
