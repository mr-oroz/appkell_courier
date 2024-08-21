import 'package:appkel_for_courier_flutter/providers/auth_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/registration_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/select_phone_email/select_phone_email_screen.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/user_credentials_model.dart';
import '../../main_screen/main_screen.dart';

class SelectRoleScreen extends HookConsumerWidget {
  const SelectRoleScreen({
    super.key,
    this.isSelectPhone = true,
    this.isExternalProvider = false,
    this.userCredentialsModel,
  });

  final bool isSelectPhone;
  final bool isExternalProvider;
  final UserCredentialsModel? userCredentialsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      } else if (nextState.status.isError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Что-то пошло не так'),
          ),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(51),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Image.asset(
                  'assets/images/app_logo.png',
                  height: 80,
                  color: const Color(0xFFFF6C29),
                ),
              ),
            ),
            const Gap(20),
            const SizedBox(
              width: 313,
              child: Text(
                'Заказывайте продукты не выходя из дома',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6A6A6A),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 44),
                child: Text(
                  'Какая у вас роль?',
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isExternalProvider) {
                        final model = userCredentialsModel!.copyWith(
                          role: 'courier',
                        );
                        ref
                            .read(authProvider.notifier)
                            .sendUserCredentials(model);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectPhoneEmailScreen(
                              role: 'courier',
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFE8E8E8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Курьер',
                                style: TextStyle(
                                  color: Color(0xFF444444),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Доставлять заказы',
                                style: TextStyle(
                                  color: Color(0xFF6A6A6A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          AppIcon(AppIcons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: () {
                      if (isExternalProvider) {
                        final model = userCredentialsModel!.copyWith(
                          role: 'shop',
                        );
                        ref
                            .read(authProvider.notifier)
                            .sendUserCredentials(model);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectPhoneEmailScreen(
                              role: 'shop',
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFE8E8E8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Магазин',
                                style: TextStyle(
                                  color: Color(0xFF444444),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Размещать товаров и принимать заказы',
                                style: TextStyle(
                                  color: Color(0xFF6A6A6A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          AppIcon(AppIcons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: () {
                      if (isExternalProvider) {
                        final model = userCredentialsModel!.copyWith(
                          role: 'restaurant',
                        );
                        ref
                            .read(authProvider.notifier)
                            .sendUserCredentials(model);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectPhoneEmailScreen(
                              role: 'restaurant',
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFE8E8E8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ресторан',
                                style: TextStyle(
                                  color: Color(0xFF444444),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Создавать свои блюда и принимать заказы',
                                style: TextStyle(
                                  color: Color(0xFF6A6A6A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          AppIcon(AppIcons.arrow_right)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
