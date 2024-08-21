import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../widgets/app_icon.dart';

class SearchProductTextField extends StatelessWidget {
  const SearchProductTextField({
    super.key,
    this.onChanged,
  });

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C1A1A1A),
            blurRadius: 20,
            offset: Offset(0, 5),
            spreadRadius: 5,
          )
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Искать продукты',
          hintStyle: TextStyle(
            color: Color(0xFFA4A4A4),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(15),
              AppIcon(AppIcons.search),
              Gap(15),
            ],
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
