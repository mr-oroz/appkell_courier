import 'package:appkel_for_courier_flutter/ui/screens/profile/edit_user_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/profile_model.dart';
import '../../../../providers/requisite_providers.dart';
import 'add_requisite_sheet.dart';

class RequisiteWidget extends HookConsumerWidget {
  const RequisiteWidget({
    super.key,
    this.requisites = const [],
  });

  final List<RequisiteModel> requisites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requisiteList = useState(requisites);
    return Column(
      children: [
        // const Gap(15),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFE5E5E5),
        ),
        // const Gap(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ваши реквизиты',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 4),
              Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Gap(15),
                      ListView.separated(
                        itemBuilder: (context, index) {
                          final requisite = requisiteList.value[index];
                          if (requisite.nums != null) {
                            return GestureDetector(
                              onLongPress: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: Text(
                                      'Вы уверены, что хотите удалить реквизит? \n(${requisite.nums})',
                                    ),
                                    actions: <Widget>[
                                      CupertinoDialogAction(
                                        child: const Text(
                                          'Удалить',
                                          style: TextStyle(
                                            color: Color(0xFFF81515),
                                          ),
                                        ),
                                        onPressed: () async {
                                          ref.read(
                                            deleteRequisiteProvider(
                                                    requisite.id!)
                                                .future,
                                          );
                                          final list =
                                              List<RequisiteModel>.from(
                                                  requisiteList.value);
                                          list.removeAt(index);
                                          requisiteList.value = list;
                                          Navigator.of(context).pop();
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
                              child: Text(
                                requisite.nums!,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  // color: Color(0xFF222222),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: requisiteList.value.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      if (requisiteList.value.length < 2)
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditUserProfile(),
                              ),
                            );
                            // final result = await showModalBottomSheet(
                            //   context: context,
                            //   isScrollControlled: true,
                            //   builder: (context) {
                            //     return const AddRequisiteSheet();
                            //   },
                            // );
                            // if (result != null) {
                            //   final list = List<RequisiteModel>.from(
                            //       requisiteList.value);
                            //   list.add(RequisiteModel(nums: result));
                            //   requisiteList.value = list;
                            // }
                          },
                          child: const Text(
                            'Добавить реквизит',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Color(0xFF3F8AE0),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      const Gap(15)
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  String formatPhoneNumber(String phoneNumber) {
    return "+ ${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, 9)} ${phoneNumber.substring(9, 12)}";
  }
}
