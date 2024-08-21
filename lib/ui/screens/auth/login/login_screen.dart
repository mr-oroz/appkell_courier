import 'package:appkel_for_courier_flutter/ui/screens/auth/has_phone_number/has_phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../helpers/formatter.dart';
import '../../../../hooks/use_form_key.dart';
import '../../../../l10n/strings.dart';
import '../../../../providers/auth_providers.dart';
import '../../../widgets/app_icon.dart';
import '../../main_screen/main_screen.dart';
import '../registration/widgets/custom_text_form_field.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key, required this.isPhoneLogin});

  final bool isPhoneLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);

    final loginTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final formKey = useFormKey();
    final loginState = ref.watch(loginProvider);

    final isButtonEnabled = useCallback(() {
      return loginTextController.text.isNotEmpty &&
          passwordTextController.text.isNotEmpty;
    }, []);

    ref.listen(loginProvider, (prevState, nextState) {
      if (nextState.status.isError) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nextState.error!),
          ),
        );
      }
    });
    ref.listen(authProvider, (prevState, nextState) {
      if (nextState.status.isAuth) {
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
                          'Вход',
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
                  const Gap(57),
                  const Gap(70),
                  Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 430),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            keyboardType: isPhoneLogin
                                ? TextInputType.phone
                                : TextInputType.emailAddress,
                            inputFormatters: [
                              if (isPhoneLogin) phoneFormatter,
                            ],
                            hintText:
                                isPhoneLogin ? 'Ваш номер телефона' : 'Почта',
                            controller: loginTextController,
                            prefixIcon:
                                isPhoneLogin ? AppIcons.call : AppIcons.sms,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return isPhoneLogin
                                    ? 'Введите номер телефона'
                                    : 'Введите почту';
                              }
                              if (value.length != 16 && isPhoneLogin) {
                                return 'Номер телефона должен содержать 12 цифр';
                              }
                              if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value) &&
                                  !isPhoneLogin) {
                                return 'Введите корректную почту';
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
                            hintText: 'Пароль',
                            controller: passwordTextController,
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
                          const Gap(10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HasPhoneNumberScreen(
                                    phoneSelected: isPhoneLogin,
                                  ),
                                ),
                              ),
                              child: Text(
                                Strings.of(context).forgotPassword,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(94),
                  GestureDetector(
                    onTap: () {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid || loginState.status.isLoading) {
                        return;
                      }
                      ref.read(loginProvider.notifier).login(
                            isPhoneLogin
                                ? loginTextController.text
                                    .replaceAll('+', '')
                                    .replaceAll(' ', '')
                                    .replaceAll('(', '')
                                    .replaceAll(')', '')
                                    .replaceAll('-', '')
                                : loginTextController.text,
                            passwordTextController.text,
                          );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: loginState.status.isLoading || !isButtonEnabled()
                            ? const Color(0xFFD9D9D9)
                            : Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: !loginState.status.isLoading
                          ? const Text(
                              'Далее',
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
