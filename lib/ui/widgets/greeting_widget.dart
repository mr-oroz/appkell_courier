import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'app_icon.dart';
import 'primary_rounded_divider.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 430, minWidth: 430),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppIcon(AppIcons.arrow_down),
          const Gap(20),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF212121),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(14),
          const PrimaryRoundedDivider(),
        ],
      ),
    );
  }
}
