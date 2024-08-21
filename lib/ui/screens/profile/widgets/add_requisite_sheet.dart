import 'package:appkel_for_courier_flutter/ui/screens/profile/widgets/change_type_requisite.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../data/models/profile_model.dart';
import '../../../../providers/requisite_providers.dart';

class AddRequisiteSheet extends HookConsumerWidget {
  const AddRequisiteSheet({
    super.key,
    this.requisiteModel,
  });

  final RequisiteModel? requisiteModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectedPhone = useState(true);
    final numberController =
        useTextEditingController(text: requisiteModel?.nums ?? '');
    final nameBankController =
        useTextEditingController(text: requisiteModel?.title ?? 'Мбанк');
    final isValid = useState(false);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 15,
        right: 15,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          const SizedBox(
            height: 9,
            width: double.infinity,
          ),
          Container(
            width: 54,
            height: 3,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          TextFormField(
            controller: nameBankController,
            onChanged: (value) {
              if (value.isEmpty) {
                isValid.value = false;
              }
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Введите название банка',
              hintStyle: TextStyle(
                color: Color(0xFFA4A4A4),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ChangeTypeRequisite(
              sendType: isSelectedPhone.value ? 1 : 2,
              onSendTypeChanged: (newSendType) {
                FocusManager.instance.primaryFocus?.unfocus();
                isSelectedPhone.value = newSendType == 1;
                numberController.clear();
              },
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          TextFormField(
            controller: numberController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              isSelectedPhone.value
                  ? MaskTextInputFormatter(
                      mask: '+996 (###)-###-###',
                      filter: {"#": RegExp(r'[0-9]')},
                    )
                  : MaskTextInputFormatter(
                      mask: '#### #### #### ####',
                      filter: {"#": RegExp(r'[0-9]')},
                    ),
            ],
            validator: (value) {
              if (value?.isEmpty == true) {
                return 'Поле не может быть пустым';
              }
              if (isSelectedPhone.value) {
                if (value!.length < 18) {
                  return 'Введите полный номер телефона';
                }
              } else {
                if (value!.length < 19) {
                  return 'Введите полный номер карты';
                }
              }
              return null;
            },
            onChanged: (value) {
              if (value.isEmpty) {
                isValid.value = false;
              }
            },
            decoration: InputDecoration(
              errorText: numberController.text.isEmpty
                  ? 'Поле не может быть пустым'
                  : isSelectedPhone.value
                      ? numberController.text.length < 18
                          ? 'Введите полный номер телефона'
                          : null
                      : numberController.text.length < 19
                          ? 'Введите полный номер карты'
                          : null,
              filled: true,
              fillColor: Colors.transparent,
              hintText: isSelectedPhone.value
                  ? 'Введите номер телефона'
                  : 'Введите номер карты',
              hintStyle: const TextStyle(
                color: Color(0xFFA4A4A4),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              isValid.value = true;
              if (numberController.text.isEmpty == true) {
                // return 'Поле не может быть пустым';
                return;
              }
              if (isSelectedPhone.value) {
                if (numberController.text.length < 18) {
                  // return 'Введите полный номер телефона';
                  return;
                }
              } else {
                if (numberController.text.length < 19) {
                  return;
                  // 'Введите полный номер карты';
                }
              }
              if (requisiteModel != null) {
                ref.read(updateRequisiteProvider(requisiteModel!.id,
                    numberController.text, nameBankController.text));
              } else {
                ref.read(addRequisiteProvider(
                    numberController.text, nameBankController.text));
              }
              Navigator.pop(
                  context,
                  MapEntry(
                    nameBankController.text,
                    numberController.text,
                  ));
            },
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6C29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Добавить реквизит',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom != 0 ? 20 : 10,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
