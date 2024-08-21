import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/theme/theme.dart';

import 'app_icon.dart';

class MoreDetailsButton extends StatelessWidget {
  const MoreDetailsButton({
    super.key,
    this.gap,
    this.horizontalPadding,
    this.verticalPadding,
    required this.title,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.onTap,
  });

  final String title;
  final double? iconSize;
  final AppIcons? icon;
  final Color? iconColor;
  final double? gap;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.defaultTheme.mainTextColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 10,
              vertical: verticalPadding ?? 7,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: -0.50,
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(4),
                AppIcon(
                  icon ?? AppIcons.arrow_down,
                  size: iconSize ?? 16,
                  color: iconColor ?? AppTheme.defaultTheme.mainTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
