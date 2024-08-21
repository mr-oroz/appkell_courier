import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/address_details_model.dart';
import '../../../providers/user_providers.dart';
import '../../widgets/app_icon.dart';
import "package:appkel_for_courier_flutter/ui/screens/address_information/text_of_the_obligation.dart";

class AddressDetailsScreen extends HookConsumerWidget {
  const AddressDetailsScreen({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final streetNameTextController = useTextEditingController();
    final numberTextController = useTextEditingController();
    final floorTextController = useTextEditingController();
    final apartmentTextController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const AppIcon(
              AppIcons.arrow_down,
            ),
          ),
        ),
        title: const Text(
          'Детали адреса',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextOfTheObligation(
            isObligatory: true,
          ),
          const Gap(5),
          const ColoredBox(
            color: Color(0xFFF2F2F2),
            child: SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
          TextFormField(
            controller: streetNameTextController,
            decoration: const InputDecoration(
              labelText: 'Название адреса',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          const ColoredBox(
            color: Color(0xFFF2F2F2),
            child: SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
          const Gap(15),
          const TextOfTheObligation(
            isObligatory: true,
          ),
          const Gap(5),
          const ColoredBox(
            color: Color(0xFFF2F2F2),
            child: SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
          TextFormField(
            controller: numberTextController,
            decoration: const InputDecoration(
              labelText: 'Номер',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          const ColoredBox(
            color: Color(0xFFF2F2F2),
            child: SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              if (streetNameTextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Введите название адреса'),
                  ),
                );
              } else if (numberTextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Введите номер'),
                  ),
                );
              } else if (floorTextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Введите этаж'),
                  ),
                );
              } else if (apartmentTextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Введите квартиру'),
                  ),
                );
              } else {
                ref.read(userProvider.notifier).setAddressDetails(
                      AddressDetailsModel(
                        streetName: streetNameTextController.text,
                        number: numberTextController.text,
                        floor: floorTextController.text,
                        apartment: apartmentTextController.text,
                        latitude: latitude,
                        longitude: longitude,
                      ),
                    );
              }
            },
            child: Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: ShapeDecoration(
                color: false || false
                    ? const Color(0xFFD9D9D9)
                    : const Color(0xFFFF6C29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              alignment: Alignment.center,
              child: true
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
          const Gap(50),
        ],
      ),
    );
  }
}
