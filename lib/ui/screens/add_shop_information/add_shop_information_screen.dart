import 'dart:io';

import 'package:appkel_for_courier_flutter/helpers/formatter.dart';
import 'package:appkel_for_courier_flutter/providers/user_providers.dart';
import 'package:appkel_for_courier_flutter/ui/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helpers/image_helper.dart';
import '../auth/registration/widgets/upload_image_container.dart';

class AddShopInformationScreen extends HookConsumerWidget {
  const AddShopInformationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopName = useTextEditingController();
    final shopAddress = useTextEditingController();
    final shopPhoneNumber = useTextEditingController();

    final shopDocument = useState<File?>(null);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final isLoading = useState(false);

    ref.listen(userProvider, (previous, next) {
      if (next.profile?.isHasShopInfo == true) {
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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  const Gap(100),
                  const Text(
                    'Добавьте информацию о магазине',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6C29),
                    ),
                  ),
                  const Gap(20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Для подтверждения вам необходимо предоставить следующую информацию: название магазина или ресторана, адрес, номер телефона, а также загрузить документ, подтверждающий ваше юридическое лицо.',
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: shopName,
                    decoration: const InputDecoration(
                      labelText: 'Название магазина',
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: shopAddress,
                    decoration: const InputDecoration(
                      labelText: 'Адрес',
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: shopPhoneNumber,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneFormatter],
                    decoration: const InputDecoration(
                      labelText: 'Номер телефона',
                    ),
                  ),
                  const Gap(20),
                  UploadImageContainer(
                    text: 'Файл вашего юр. лица',
                    onTap: () async {
                      final image =
                          await ImageHelper.pickImageFromSource(context);
                      if (image != null) {
                        shopDocument.value = image;
                      }
                    },
                    fileName: shopDocument.value?.path.split('/').last,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () async {
                      if (shopName.text.isEmpty ||
                          shopAddress.text.isEmpty ||
                          shopPhoneNumber.text.isEmpty ||
                          shopDocument.value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Пожалуйста, заполните все поля и загрузите документ.'),
                          ),
                        );
                        return;
                      }
                      if (isLoading.value) return;
                      isLoading.value = true;
                      await ref.read(userProvider.notifier).updateProfile(
                        {
                          'shop_name': shopName.text,
                          'address': shopAddress.text,
                          'phone': shopPhoneNumber.text
                              .replaceAll('+', '')
                              .replaceAll(' ', ''),
                          'entity_file': shopDocument.value,
                          'is_social': true,
                        },
                      );
                    },
                    child: !isLoading.value
                        ? const Text('Отправить')
                        : const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
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
