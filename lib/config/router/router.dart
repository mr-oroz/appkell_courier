
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/screens/auth/auth_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';


import 'app_route.dart';

final class Routes {
  static const splash = AppRoute('/splash');
  static const auth = AppRoute('/auth');
  static const login = AppRoute('/login');
}

GoRouter buildRouter(BuildContext context) {
  return GoRouter(
    initialLocation: Routes.splash.path,
    routes: [
      GoRoute(
        path: Routes.splash.path,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.auth.path,
        builder: (context, state) {
          return const AuthScreen();
        },
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text('Route not found ${state.path}'),
        ),
      );
    },
  );
}
