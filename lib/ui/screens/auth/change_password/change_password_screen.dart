import 'package:appkel_for_courier_flutter/data/models/change_password_model.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/auth_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../hooks/use_form_key.dart';
import '../../../../providers/auth_providers.dart';
import '../../../widgets/app_icon.dart';
import '../../main_screen/main_screen.dart';
import '../registration/widgets/custom_text_form_field.dart';

class ChangePasswordScreen extends HookConsumerWidget {
  const ChangePasswordScreen({
    super.key,
    this.code,
    required this.isSelectedPhone,
    required this.login,
  });

  final String login;
  final String? code;
  final bool isSelectedPhone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final changePasswordState = ref.watch(changePasswordProvider);

    final formKey = useFormKey();

    ref.listen(changePasswordProvider, (prevState, nextState) {
      if (nextState.status.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пароль успешно изменен'),
          ),
        );
        Navigator.of(context)
          ..pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
            (_) {
              return false;
            },
          )
          ..push(
            MaterialPageRoute(
              builder: (context) => LoginScreen(isPhoneLogin: isSelectedPhone),
            ),
          );
      } else if (nextState.status.isError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nextState.error?.toString() ?? 'Что-то пошло не так'),
          ),
        );
      }
    });

    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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
                  const Gap(179),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: 'Создайте пароль',
                    controller: passwordController,
                    prefixIcon: AppIcons.key,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите пароль';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      count.value++;
                    },
                  ),
                  const Gap(25),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: 'Повторите пароль',
                    controller: repeatPasswordController,
                    prefixIcon: AppIcons.key,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите пароль еще раз';
                      }
                      if (value != passwordController.text) {
                        return 'Пароли не совпадают';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      count.value++;
                    },
                  ),
                  const Gap(179),
                  GestureDetector(
                    onTap: () {
                      formKey.currentState!.validate();
                      if (changePasswordState.status.isLoading ||
                          passwordController.text.isEmpty ||
                          repeatPasswordController.text.isEmpty) {
                        return;
                      }
                      if (formKey.currentState!.validate()) {
                        ref
                            .read(changePasswordProvider.notifier)
                            .changePassword(ChangePasswordModel(
                              email: isSelectedPhone ? null : login,
                              phone: isSelectedPhone
                                  ? login
                                      .replaceAll('+', '')
                                      .replaceAll(' ', '')
                                      .replaceAll('(', '')
                                      .replaceAll(')', '')
                                      .replaceAll('-', '')
                                  : null,
                              code: code,
                              password: passwordController.text,
                              password2: passwordController.text,
                            ));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: changePasswordState.status.isLoading ||
                                passwordController.text.isEmpty ||
                                repeatPasswordController.text.isEmpty
                            ? const Color(0xFFD9D9D9)
                            : Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: !changePasswordState.status.isLoading
                          ? const Text(
                              'Зарегистрироваться',
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
