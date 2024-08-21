import 'package:appkel_for_courier_flutter/providers/whatsapp_number_provider.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/auth_providers.dart';
import '../auth/auth_screen.dart';
import '../user_agreement/user_agreement_screen.dart';

class MoreProfileScreen extends HookConsumerWidget {
  const MoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final whatsappNumberState = ref.watch(whatsappNumberProvider);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Gap(10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserAgreementScreen(
                    pdfFile: 'assets/pdf/terms_of_use_appkel.pdf',
                    appBarText: 'Пользовательское соглашение',
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Пользовательское соглашение',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppIcon(AppIcons.arrow_right)
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserAgreementScreen(
                    pdfFile: 'assets/pdf/privacy_policy_appkel.pdf',
                    appBarText: 'Политика конфиденциальности',
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Политика конфиденциальности',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppIcon(AppIcons.arrow_right),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
          InkWell(
            onTap: () {
              final phone = whatsappNumberState.value;
              if (phone != null) {
                openWhatsapp(phone);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Служба поддержки',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppIcon(AppIcons.arrow_right),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE5E5E5),
          ),
          const Gap(30),
          GestureDetector(
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Вы действительно хотите удалить аккаунт?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text(
                        'Удалить',
                        style: TextStyle(
                          color: Color(0xFFF81515),
                        ),
                      ),
                      onPressed: () async {
                        // await ref.read(authProvider.notifier).deleteAccount();
                        ref.read(authProvider.notifier).unauthenticate();
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text('Отмена'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Удалить аккаунт',
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFF0000),
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title:
                      const Text('Вы действительно хотите выйти из аккаунта?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text(
                        'Выйти',
                        style: TextStyle(
                          color: Color(0xFFF81515),
                        ),
                      ),
                      onPressed: () {
                        ref.read(authProvider.notifier).unauthenticate();
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text('Отмена'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Выйти из аккаунта',
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFF0000),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              String whatsapp = "https://www.instagram.com/nevodevs";
              launch(whatsapp);
            },
            child: const Text.rich(
              TextSpan(
                text: 'Made by ',
                style: TextStyle(
                  color: Color(0xFF8A8A8A),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Nevo',
                    style: TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Devs',
                    style: TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(34),
        ],
      ),
    );
  }
}

openWhatsapp(String phone) async {
  String whatsapp = "https://wa.me/$phone?text=Здравствуйте!";

  launch(whatsapp);
}
