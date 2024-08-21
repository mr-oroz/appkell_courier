import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../registration/registration_screen.dart';

class SelectPhoneEmailScreen extends HookConsumerWidget {
  const SelectPhoneEmailScreen({
    super.key,
    required this.role,
  });

  final String role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            const Gap(114),
            const Text(
              'Зарегистрируйтесь через',
              style: TextStyle(
                color: Color(0xFF444444),
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
            const Gap(50),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SelectRoleScreen(
                //       isSelectPhone: true,
                //     ),
                //   ),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(
                      role: role,
                      isSelectPhone: true,
                    ),
                  ),
                );
              },
              child: Container(
                width: 363,
                height: 45,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFF6C29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Номер телефона',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const Gap(15),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SelectRoleScreen(
                //       isSelectPhone: false,
                //     ),
                //   ),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(
                      role: role,
                      isSelectPhone: false,
                    ),
                  ),
                );
              },
              child: Container(
                width: 363,
                height: 45,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFF6C29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
