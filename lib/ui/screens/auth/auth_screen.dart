import 'dart:io';

import 'package:appkel_for_courier_flutter/providers/auth_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/login/login_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/select_role/select_role_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/strings.dart';
import '../../widgets/app_icon.dart';
import 'select_phone_email/select_phone_email_screen.dart';
import 'widgets/login_with_external_provider.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isLoadingAppleSignIn = useState(false);
    ref.listen(authProvider, (prevState, nextState) {
      if (nextState.status.isHasNotEmail) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectRoleScreen(
              isExternalProvider: true,
              userCredentialsModel: nextState.userCredentialsModel,
            ),
          ),
        );
      } else if (nextState.status.isAuth) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(110),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                  text: Strings.of(context).welcomeToAppKel,
                  children: const [
                    TextSpan(
                      text: 'AppKel',
                      style: TextStyle(
                        color: Color(0xFFFF6C29),
                      ),
                    ),
                    TextSpan(
                      text: ' !',
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Strings.of(context).orderProductsWithoutLeavingHome,
                  style: const TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(48),
              LoginWithExternalProvider(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(
                        isPhoneLogin: true,
                      ),
                    ),
                  );
                },
                isLoading: false,
                iconName: AppIcons.call,
                text: 'Войти через номер телефона',
              ),
              const Gap(15),
              LoginWithExternalProvider(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(
                        isPhoneLogin: false,
                      ),
                    ),
                  );
                },
                isLoading: false,
                iconName: AppIcons.sms,
                appIconColor: Colors.black,
                text: 'Войти через Email',
              ),
              const Gap(15),
              LoginWithExternalProvider(
                onTap: () {
                  if (authState.status.isLoading) return;
                  ref.read(authProvider.notifier).googleSignIn();
                },
                isLoading: authState.status.isLoading,
                iconName: AppIcons.google,
                text: 'Войти через Google почту',
              ),
              const Gap(15),
              if (Platform.isIOS) ...[
                LoginWithExternalProvider(
                  onTap: () async {
                    if (authState.status.isLoading ||
                        isLoadingAppleSignIn.value) return;
                    isLoadingAppleSignIn.value = true;
                    await ref.read(authProvider.notifier).appleIdSignIn();
                    isLoadingAppleSignIn.value = false;
                  },
                  isLoading: isLoadingAppleSignIn.value,
                  iconName: AppIcons.apple,
                  text: 'Вход через Apple',
                ),
                // const Gap(15),
              ],
              // LoginWithExternalProvider(
              //   onTap: () {
              //     if (authState.status.isLoading) return;
              //     // ref.read(authProvider.notifier).signInWithFacebook();
              //   },
              //   isLoading: false,
              //   image: Image.asset(
              //     'assets/images/facebook.png',
              //     height: 28,
              //     width: 28,
              //   ),
              //   text: 'Войти через icloud',
              // ),
              const Gap(50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  text: 'Впервые у нас? ',
                  children: [
                    TextSpan(
                      text: 'Зарегистироваться',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SelectRoleScreen(),
                            ),
                          );
                        },
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
