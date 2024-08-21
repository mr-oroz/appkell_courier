import 'dart:io';

import 'package:appkel_for_courier_flutter/data/models/registration_model.dart';
import 'package:appkel_for_courier_flutter/helpers/image_helper.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/location_search_screen.dart';
import 'package:appkel_for_courier_flutter/ui/screens/auth/registration/widgets/custom_text_address.dart';
import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../helpers/formatter.dart';
import '../../../../hooks/use_form_key.dart';
import '../../../../providers/auth_providers.dart';
import '../../user_agreement/user_agreement_screen.dart';
import '../confirmation_code/confirmation_code_screen.dart';

import 'widgets/custom_text_form_field.dart';
import 'widgets/upload_image_container.dart';

class RegistrationScreen extends HookConsumerWidget {
  const RegistrationScreen(
      {super.key, required this.role, required this.isSelectPhone});

  final String role;
  final bool isSelectPhone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);
    final selectedRole = useState<String>(role);
    final formKey = useFormKey();
    final fioTextController = useTextEditingController();
    final companyController = useTextEditingController();
    final whatsAppPhoneController = useTextEditingController();
    final emailController = useTextEditingController();
    final authState = ref.watch(authProvider);
    final addressController = useTextEditingController();
    final frontPassport = useState<File?>(null);
    final backPassport = useState<File?>(null);
    final legalFileFaces = useState<File?>(null);
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final registrationState = ref.watch(registrationProvider);

    ref.listen(registrationProvider, (prevState, nextState) {
      if (nextState.status.isError) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nextState.error!),
          ),
        );
      } else if (nextState.status.isSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationCodeScreen(
              login: whatsAppPhoneController.text.isNotEmpty
                  ? whatsAppPhoneController.text
                  : emailController.text,
              isSelectedPhone: isSelectPhone,
            ),
          ),
        );
      }
    });

    final isButtonEnabled = useCallback(() {
      return passwordController.text.isNotEmpty &&
          repeatPasswordController.text.isNotEmpty &&
          (selectedRole.value == 'courier'
              ? frontPassport.value != null && backPassport.value != null
              : legalFileFaces.value != null) &&
          (selectedRole.value == 'courier'
              ? fioTextController.text.isNotEmpty
              : companyController.text.isNotEmpty) &&
          (isSelectPhone
              ? whatsAppPhoneController.text.isNotEmpty
              : emailController.text.isNotEmpty);
    }, []);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const Gap(21),
                  Stack(
                    children: [
                      const Center(
                        child: Text(
                          'Регистрация',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const AppIcon(AppIcons.arrow_down),
                        ),
                      ),
                    ],
                  ),
                  const Gap(57),
                  if (selectedRole.value == 'courier') ...[
                    CustomTextFormField(
                      radius: 15,
                      hintText: 'ФИО',
                      controller: fioTextController,
                      prefixIcon: AppIcons.user,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите ФИО';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        count.value++;
                      },
                    ),
                  ] else ...[
                    CustomTextFormField(
                      radius: 15,
                      hintText: 'Название компании',
                      controller: companyController,
                      prefixIcon: AppIcons.briefcase,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите название компании';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        count.value++;
                      },
                    ),
                  ],
                  const Gap(20),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: ChangeTypeRegister(
                  //     sendType: isSelectedPhone.value ? 2 : 1,
                  //     onSendTypeChanged: (newSendType) {
                  //       FocusManager.instance.primaryFocus?.unfocus();
                  //       isSelectedPhone.value = newSendType == 2;
                  //     },
                  //   ),
                  // ),
                  // const Gap(10),
                  if (isSelectPhone) ...[
                    CustomTextFormField(
                      radius: 15,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        phoneFormatter,
                      ],
                      hintText: 'Номер телефона',
                      controller: whatsAppPhoneController,
                      prefixIcon: AppIcons.call,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите номер телефона';
                        }
                        if (value.length != 16) {
                          return 'Номер телефона должен содержать 12 цифр';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        count.value++;
                      },
                    ),
                  ] else ...[
                    CustomTextFormField(
                      radius: 15,
                      hintText: 'Почта',
                      controller: emailController,
                      prefixIcon: AppIcons.sms,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите почту';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Введите корректную почту';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        count.value++;
                      },
                    ),
                  ],
                  // const Gap(25),
                  // CustomTextFormField(
                  //   hintText:
                  //       role == 'courier' ? 'Адрес' : 'Адрес вашей компании',
                  //   controller: addressController,
                  //   prefixIcon: AppIcons.location,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Введите адрес';
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (value) {
                  //     count.value++;
                  //   },
                  // ),
                  const Gap(25),
                  CustomTextAddress(
                    hintText: authState.address == null &&
                            addressController.text == ''
                        ? 'Ваш основной адрес'
                        : null,
                    controller: addressController,
                    prefixIcon: AppIcons.location,
                    readOnly: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationSearchScreen(),
                        ),
                      );
                    },
                  ),
                  const Gap(25),
                  if (selectedRole.value == 'courier') ...[
                    UploadImageContainer(
                      text: 'Лицевая сторона паспорта',
                      onTap: () async {
                        final image =
                            await ImageHelper.pickImageFromSource(context);

                        frontPassport.value = image;
                        count.value++;
                      },
                      fileName: frontPassport.value?.path.split('/').last,
                    ),
                    const Gap(25),
                    UploadImageContainer(
                      text: 'Обратная сторона паспорта',
                      onTap: () async {
                        final image =
                            await ImageHelper.pickImageFromSource(context);
                        backPassport.value = image;
                        count.value++;
                      },
                      fileName: backPassport.value?.path.split('/').last,
                    ),
                    const Gap(25),
                  ] else ...[
                    UploadImageContainer(
                      text: 'Файл вашего юр. лица',
                      onTap: () async {
                        final image =
                            await ImageHelper.pickImageFromSource(context);
                        legalFileFaces.value = image;
                        count.value++;
                      },
                      fileName: legalFileFaces.value?.path.split('/').last,
                    ),
                    const Gap(25),
                  ],
                  CustomTextFormField(
                    radius: 15,
                    obscureText: true,
                    hintText: 'Создайте пароль',
                    controller: passwordController,
                    prefixIcon: AppIcons.key,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите пароль';
                      }
                      if (value.length < 6) {
                        return 'Пароль должен содержать не менее 6 символов';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      count.value++;
                    },
                  ),
                  const Gap(25),
                  CustomTextFormField(
                    radius: 15,
                    obscureText: true,
                    hintText: 'Повторите пароль',
                    controller: repeatPasswordController,
                    prefixIcon: AppIcons.key,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите пароль еще раз';
                      }
                      if (value != passwordController.text) {
                        return 'Пароли не совпадают';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      count.value++;
                    },
                  ),
                  const Gap(25),
                  GestureDetector(
                    onTap: () {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid || registrationState.status.isLoading) {
                        return;
                      }
                      ref.read(registrationProvider.notifier).register(
                          RegistrationModel(
                            role: selectedRole.value,
                            fio: fioTextController.text,
                            companyName: companyController.text,
                            whatsappNumber: whatsAppPhoneController.text,
                            email: emailController.text,
                            // address: addressController.text,
                            password: passwordController.text,
                            frontPassport: frontPassport.value,
                            backPassport: backPassport.value,
                            legalFileFaces: legalFileFaces.value,
                          ),
                          isSelectPhone);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: registrationState.status.isLoading ||
                                !isButtonEnabled()
                            ? const Color(0xFFD9D9D9)
                            : Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: !registrationState.status.isLoading
                          ? const Text(
                              'Далее',
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
                  const Gap(20),
                  GestureDetector(
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
                    child: Column(
                      children: [
                        const Text(
                          'Нажимая кнопку "Далее", вы соглашаетесь с условиями',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Пользовательского соглашения',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
