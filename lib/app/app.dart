import 'dart:async';

import 'package:appkel_for_courier_flutter/config/utils/push_notifications_manager.dart';
import 'package:appkel_for_courier_flutter/providers/auth_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/select_role/select_role_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/main_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/splash/splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:pdf_render/pdf_render_widgets.dart';

import '../config/router/router.dart';
import '../config/theme/theme.dart';
import '../data/storage/local_storage.dart';
import '../l10n/strings.dart';
import '../ui/screens/auth/auth_screen.dart';
import 'offline_indicator_widget.dart';

class App extends StatefulHookConsumerWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();

  static _AppState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>()!;
  static AppTheme appTheme(BuildContext context) => of(context)._appTheme;
}

class _AppState extends ConsumerState<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  AppTheme _appTheme = AppTheme.defaultTheme;
  late GoRouter _router;

  late Locale _locale = LocalStorage().locale ?? const Locale('ru');
  Locale get locale => _locale;

  bool isHasConnection = true;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    initializeTheme();
    initializeRouter();
    initializePushNotifications();
    listenInternetConnection();

    // PushNotificationsManager.onOrderAcceptedMessage = (message) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     showDialog(
    //       context: context,
    //       barrierColor: Colors.transparent,
    //       builder: (BuildContext context) {
    //         return ClientPaidDialog(
    //           checkImage: message['check_image'],
    //           orderId: message['order_id'],
    //         );
    //       },
    //     );
    //   });
    // };
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (prevState, nextState) {
      if (prevState?.status.isAuth == true && nextState.status.isUnauth) {
        _navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ),
          (_) {
            return false;
          },
        );
      }
    });
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: _appTheme.themeData,
        title: 'Appkel для курьера и магазина',
        debugShowCheckedModeBanner: false,
        locale: _locale,
        navigatorKey: _navigatorKey,

        localizationsDelegates: Strings.localizationsDelegates,
        supportedLocales: Strings.supportedLocales,
        home: const SplashScreen(),
        // routerDelegate: _router.routerDelegate,
        // routeInformationParser: _router.routeInformationParser,
        // routeInformationProvider: _router.routeInformationProvider,
        builder: (context, child) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    (isHasConnection ? 0 : kBottomBarHeight),
                width: MediaQuery.of(context).size.width,
                child: child!,
              ),
              if (!isHasConnection) const OfflineIndicator(),
            ],
          );
        },
      ),
    );
  }

  void initializeTheme() {
    _appTheme = AppTheme.fromType(LocalStorage().themeType);
  }

  void initializeRouter() {
    _router = buildRouter(context);
  }

  void initializePushNotifications() {
    PushNotificationsManager().init();
    // PushNotificationsManager.messages = (message) {
    //   print(message);
    // };
  }

  void setLocale(Locale newLocale) async {
    if (newLocale.languageCode == _locale.languageCode) return;
    LocalStorage().locale = newLocale;

    setState(() {
      _locale = newLocale;
    });
  }

  void toggleTheme() {
    final newType = _appTheme.type == ThemeType.darkGreen
        ? ThemeType.lightGreen
        : ThemeType.darkGreen;

    _appTheme = AppTheme.fromType(newType);
    LocalStorage().themeType = newType;
    setState(() {});
  }

  void listenInternetConnection() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      if (event.contains(ConnectivityResult.none)) {
        isHasConnection = false;
        setState(() {});
      } else {
        isHasConnection = true;
        setState(() {});
      }
    });
  }
}
