import 'package:appkel_for_courier_flutter/data/storage/local_storage.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/auth_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/widgets/restaurant_radius_select.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/widgets/restaurant_select_category.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/widgets/restaurant_timer_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../widgets/app_icon.dart';

Future<dynamic> moderationConfirmationRejected(BuildContext context) {
  return showDialog(
    useRootNavigator: false,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(17),
                const AppIcon(AppIcons.refusal),
                const Gap(8),
                const Text(
                  'Неудача в проверке данных\nорганизации',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                const Text(
                  'К сожалению, не удалось проверить информацию о вашей юридической организации. Просим вас повторно пройти процесс регистрации',
                  textAlign: TextAlign.center,
                ),
                const Gap(24),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 205,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    decoration: ShapeDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Повторить',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                // Добавьте остальные виджеты, которые вы хотите отобразить в диалоговом окне
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> moderationConfirmationPending(BuildContext context) {
  return showDialog(
    useRootNavigator: false,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(17),
                Icon(
                  Icons.pending_actions,
                  color: Colors.orange,
                  size: 50,
                ),
                Gap(15),
                Text(
                  'Проверка данных\nорганизации',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(10),
                Text(
                  'Ваша заявка на проверку данных организации принята. Как только модераторы проверят ваш аккаунт, мы вас оповестим !',
                  textAlign: TextAlign.center,
                ),
                Gap(24),

                // Добавьте остальные виджеты, которые вы хотите отобразить в диалоговом окне
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> moderationConfirmationSuccess(
    BuildContext context, String shopName) {
  bool radiusChek = LocalStorage().getBool('selected_radius') ?? false;
  return showDialog(
    useRootNavigator: false,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(17),
                const Icon(
                  Icons.safety_check,
                  color: Colors.green,
                  size: 50,
                ),
                const Gap(15),
                const Text(
                  'Ваш ресторан прошел проверку!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                Text(
                  'Ресторан $shopName был успешно одобрен и теперь доступен для пользователей мобильного приложения.',
                  textAlign: TextAlign.center,
                ),
                const Gap(24),
                ElevatedButton(
                    onPressed: () {
                      LocalStorage().setBool('moderation_success', true);
                      if (!radiusChek) {
                        radiusSelected(context);
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Продолжать'))
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> radiusSelected(BuildContext context) {
  return showDialog(
    useRootNavigator: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: RestauranRadiusSelect(),
      );
    },
  );
}

Future<dynamic> categoryRestaurantSelected(BuildContext context) {
  return showDialog(
    useRootNavigator: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: RestaurantSelectCategory(),
      );
    },
  );
}

Future<dynamic> timerRestaurantSelected(BuildContext context) {
  return showDialog(
    useRootNavigator: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: RestaurantTimerSelect(),
      );
    },
  );
}
