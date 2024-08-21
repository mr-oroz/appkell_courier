import 'package:appkel_for_courier_flutter/ui/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextAddress extends HookConsumerWidget {
  const CustomTextAddress({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final String? hintText;
  final AppIcons? prefixIcon;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(15),
                    AppIcon(
                      prefixIcon!,
                      color: const Color(0xFFAEAEAE),
                    ),
                    const Gap(15),
                    Container(
                      width: 1,
                      height: 23,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.2,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xffA5A5A5),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                  ],
                )
              : null,
          border: const OutlineInputBorder(),
        ),
        child: Text(
          controller.text.isEmpty ? hintText! : controller.text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: controller.text.isEmpty
                ? const Color(0xFFA4A4A4)
                : const Color(0xFF222222),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}