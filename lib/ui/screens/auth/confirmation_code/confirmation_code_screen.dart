import 'dart:async';
import 'package:appkel_for_courier_flutter/ui/screens/auth/change_password/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../data/models/code_verify_model.dart';
import '../../../../l10n/strings.dart';
import '../../../../providers/auth_providers.dart';
import '../../../widgets/app_icon.dart';
import '../../main_screen/main_screen.dart';

class ConfirmationCodeScreen extends HookConsumerWidget {
  const ConfirmationCodeScreen({
    super.key,
    required this.login,
    required this.isSelectedPhone,
    this.isRecoveryPassword = false,
  });

  final String login;
  final bool isSelectedPhone;
  final bool isRecoveryPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final authState = ref.watch(authProvider);

    final timeMinutes = useState(2);
    final timeSeconds = useState(00);
    final timer = useState<Timer?>(null);
    final isMounted = useIsMounted();
    useEffect(() {
      if (timer.value?.isActive == true) return;
      timer.value = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          if (!isMounted()) return;
          if (timeSeconds.value > 0) {
            timeSeconds.value--;
          } else {
            if (timeMinutes.value == 0) {
              timer.cancel();
              return;
            } else {
              timeSeconds.value = 59;
            }

            timeMinutes.value--;
          }
        },
      );
      return;
    }, [timeMinutes.value, timeSeconds.value]);

    ref.listen(authProvider, (prevState, nextState) {
      if (nextState.status.isError) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nextState.errorText!),
          ),
        );
      } else if (nextState.status.isAuth) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (_) {
            return false;
          },
        );
      } else if (nextState.status.isCodeVerify) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangePasswordScreen(
              login: isSelectedPhone ? login : login,
              code: controller.text,
              isSelectedPhone: isSelectedPhone,
            ),
          ),
        );
      }
    });

    final codeVerify = useCallback(() {
      if (controller.text.length != 4) return;
      ref.read(authProvider.notifier).codeVerify(
            CodeVerifyModel(
              code: controller.text,
              phone: isSelectedPhone ? login : null,
              email: !isSelectedPhone ? login : null,
            ),
            isRecoveryPassword,
          );
      return;
    }, [controller.text]);

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(21),
              Stack(
                children: [
                  Center(
                    child: Text(
                      Strings.of(context).confirmationCode,
                      style: const TextStyle(
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
                      Text(
                        isSelectedPhone
                            ? Strings.of(context).codeWasSentToYourNumber(login)
                            : Strings.of(context).codeWasSentToYourEmail(login),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(104),
                      SizedBox(
                        width: 90,
                        child: PinCodeTextField(
                          controller: controller,
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          hintStyle: const TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                          textStyle: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                          animationType: AnimationType.fade,
                          backgroundColor: Colors.transparent,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme.defaults(
                            shape: PinCodeFieldShape.underline,
                            borderRadius: BorderRadius.circular(5),
                            fieldOuterPadding: EdgeInsets.zero,
                            fieldWidth: 20,
                            inactiveColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
                            activeColor: Colors.transparent,
                            selectedColor: Colors.transparent,
                            selectedFillColor: Colors.transparent,
                            activeFillColor: Colors.transparent,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          hintCharacter: '0',
                          onCompleted: (v) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            codeVerify();
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      const Gap(103),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (timeMinutes.value == 0 &&
                                timeSeconds.value == 0) {
                              timeMinutes.value = 2;
                              timeSeconds.value = 00;
                              if (isSelectedPhone) {
                                ref.read(authProvider.notifier).sendCode(
                                    login
                                        .replaceAll('+', '')
                                        .replaceAll(' ', '')
                                        .replaceAll('(', '')
                                        .replaceAll(')', '')
                                        .replaceAll('-', ''),
                                    null);
                              } else {
                                ref
                                    .read(authProvider.notifier)
                                    .sendCode(null, login);
                              }
                            } else {}
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              right: 10,
                            ),
                            child: timeMinutes.value == 0 &&
                                    timeSeconds.value == 0
                                ? const Text(
                                    'Отправить код заново',
                                    style: TextStyle(
                                      color: Color(0xFFFF6C29),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Запросить код заново через ',
                                          style: TextStyle(
                                            color: Color(0xFFA4A4A4),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${timeMinutes.value < 10 ? '0' : ''}${timeMinutes.value.toString()}:'
                                              '${timeSeconds.value < 10 ? '0' : ''}${timeSeconds.value.toString()}',
                                          style: const TextStyle(
                                            color: Color(0xFF222222),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const Gap(15),
                      GestureDetector(
                        onTap: () {
                          if (authState.status.isLoading) {
                            return;
                          }
                          if (controller.text.length != 4) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Введите код',
                                ),
                              ),
                            );
                            return;
                          }
                          codeVerify();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: authState.status.isLoading
                                ? const Color(0xFFD9D9D9)
                                : Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: !authState.status.isLoading
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
            ],
          ),
        ),
      ),
    ));
  }
}
