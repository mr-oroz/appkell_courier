import 'package:appkel_for_courier_flutter/ui/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/router/router.dart';
import '../../../providers/auth_providers.dart';
import '../main_screen/main_screen.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(seconds: 3), () {
          if (ref.read(authProvider).status.isAuth) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthScreen(),
              ),
            );
          }
        });
      });
      return null;
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Image.asset(
            'assets/images/app_logo.png',
            height: 130,
            color: const Color(0xFFFF6C29),
          ),
        ),
      ),
    );
  }
}
