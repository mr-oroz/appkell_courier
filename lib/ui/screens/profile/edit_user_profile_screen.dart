import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../config/config.dart';
import '../../../data/models/profile_model.dart';
import '../../../helpers/formatter.dart';
import '../../../helpers/image_helper.dart';
import '../../../hooks/use_form_key.dart';
import '../../../providers/user_providers.dart';
import '../../widgets/app_icon.dart';
import '../address_information/select_location_screen.dart';
import 'widgets/add_requisite_sheet.dart';

class EditUserProfile extends HookConsumerWidget {
  const EditUserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final formKey = useFormKey();
    final fioTextController = useTextEditingController(
        text: userState.role == Role.courier
            ? userState.profile?.fio
            : userState.profile?.shopName);
    final phoneTextController =
        useTextEditingController(text: userState.profile?.phone);
    useEffect(() {
      phoneTextController.text = userState.profile?.phone ?? '';
      phoneTextController.value = MaskTextInputFormatter(
        mask: '+### ### ### ###',
        filter: {"#": RegExp(r'[0-9]')},
      ).formatEditUpdate(
        TextEditingValue.empty,
        TextEditingValue(text: phoneTextController.text),
      );
      return null;
    }, []);

    final coordinatesTextController = useTextEditingController(
        text: userState.profile?.latitude != null ||
                userState.profile?.longitude != null
            ? '${userState.profile?.latitude}, ${userState.profile?.longitude}'
            : null);
    final avatarUrl = useState(userState.profile?.avatar);
    final avatarFile = useState<File?>(null);
    final firstRequisiteTextController = useTextEditingController(
      text: userState.profile?.requisites.firstOrNull?.nums,
    );
    final isShowSecondRequisite = useState(
      userState.profile!.requisites.length > 1,
    );
    final secondRequisiteTextController = useTextEditingController(
      text: userState.profile!.requisites.length > 1
          ? userState.profile?.requisites[1].nums
          : null,
    );
    final firstLabelText = useState(
        userState.profile!.requisites.firstOrNull?.title ?? 'Реквизит #1');
    final secondLabelText = useState(userState.profile!.requisites.length > 1
        ? userState.profile?.requisites[1].title
        : 'Реквизит #2');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Редактирование профиля',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(
                        top: 16,
                        left: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: avatarFile.value != null
                            ? DecorationImage(
                                image: FileImage(
                                  avatarFile.value!,
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken,
                                ),
                              )
                            : avatarUrl.value != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                      '${Constants.baseUrl}${avatarUrl.value}',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.darken,
                                    ),
                                  )
                                : const DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWvy5fPgUs-S1Y-cyqeRU79zPlZYnJrFKGBJlCA0_2WQ&s'),
                                    fit: BoxFit.cover,
                                  ),
                      ),
                      padding: const EdgeInsets.all(25),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image =
                                await ImageHelper.pickImageFromSource(context);
                            if (image == null) return;
                            avatarFile.value = image;
                            ref.read(userProvider.notifier).updateProfile({
                              'photo': image,
                            });
                          },
                          child: Container(
                            height: 37,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Row(
                              children: [
                                AppIcon(
                                  AppIcons.upload,
                                  size: 23,
                                ),
                                Gap(10),
                                Text(
                                  'Загрузить изображение',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            ref.read(userProvider.notifier).updateProfile({
                              'is_delete': true,
                            });
                            avatarFile.value = null;
                            avatarUrl.value = null;
                          },
                          child: Container(
                            height: 37,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Row(
                              children: [
                                AppIcon(
                                  AppIcons.delete,
                                  size: 23,
                                ),
                                Gap(10),
                                Text(
                                  'Удалить изображение',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  onTap: () async {
                    final result = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return AddRequisiteSheet(
                          requisiteModel:
                              userState.profile?.requisites.firstOrNull,
                        );
                      },
                    );
                    if (result != null && result is MapEntry) {
                      firstLabelText.value = result.key;
                      firstRequisiteTextController.text = result.value;
                    }
                  },
                  controller: firstRequisiteTextController,
                  decoration: InputDecoration(
                    labelText: firstLabelText.value,
                    suffixIcon: isShowSecondRequisite.value
                        ? const SizedBox()
                        : TextButton(
                            onPressed: () {
                              isShowSecondRequisite.value = true;
                            },
                            child: const Text(
                              'Добавить',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  ),
                ),
                if (isShowSecondRequisite.value) ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return AddRequisiteSheet(
                            requisiteModel:
                                userState.profile!.requisites.length > 1
                                    ? userState.profile?.requisites[1]
                                    : null,
                          );
                        },
                      );
                      if (result != null && result is MapEntry) {
                        secondLabelText.value = result.key;
                        secondRequisiteTextController.text = result.value;
                      }
                    },
                    controller: secondRequisiteTextController,
                    decoration: InputDecoration(
                      labelText: secondLabelText.value,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                TextFormField(
                  controller: fioTextController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите компанию';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Компания',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: phoneTextController,
                  inputFormatters: [
                    phoneFormatter,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите телефон номер';
                    }
                    if (value.length < 16) {
                      return 'Пожалуйста, введите корректный номер';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Телефон',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectLocationScreen(),
                      ),
                    );
                    if (result != null) {
                      coordinatesTextController.text = result;
                    }
                  },
                  controller: coordinatesTextController,
                  decoration: const InputDecoration(
                    labelText: 'Координаты',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ref.read(userProvider.notifier).updateProfile({
                        'fio': fioTextController.text,
                        'phone': phoneTextController.text
                            .replaceAll('+', '')
                            .replaceAll(' ', ''),
                        'latitude':
                            coordinatesTextController.text.split(',').first,
                        'longitude':
                            coordinatesTextController.text.split(',').last,
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Сохранить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
