import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../widgets/app_icon.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.validator,
      this.prefixIcon,
      this.inputFormatters,
      this.obscureText = false,
      this.keyboardType,
      this.onChanged,
      this.maxLines = 1,
      this.radius,
      this.center,
      this.color});

  final TextEditingController? controller;
  final String? hintText;
  final AppIcons? prefixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final int maxLines;
  final Color? color;
  final double? radius;
  final TextAlign? center;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObsureText = useState(true);

    return TextFormField(
      textAlign: center ?? TextAlign.start,
      maxLines: maxLines,
      onChanged: onChanged,
      obscureText: isObsureText.value && obscureText,
      inputFormatters: inputFormatters,
      controller: controller,
      style: const TextStyle(
        color: Color(0xFF222222),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
            borderSide: BorderSide(color: color ?? const Color(0xffA5A5A5), width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
            borderSide: BorderSide(color: color ?? const Color(0xffA5A5A5), width: 0.5)),
        hintText: hintText,
        hintStyle:  TextStyle(
          color: color ??  const  Color(0xFFA4A4A4),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: obscureText
            ? GestureDetector(
                onTap: () {
                  isObsureText.value = !isObsureText.value;
                },
                child: Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: AppIcon(
                    isObsureText.value
                        ? AppIcons.eya_open
                        : AppIcons.eya_closed,
                  ),
                ),
              )
            : null,
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
                          width: 0.5,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFEAEAEA),
                        ),
                      ),
                    ),
                  ),
                  const Gap(15),
                ],
              )
            : null,
      ),
      validator: validator,
    );
  }
}
