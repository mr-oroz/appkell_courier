import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/profile_model.dart';

class UserField extends StatelessWidget {
  const UserField({
    super.key,
    this.title,
    this.onChanged,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
  });

  final String? title;
  final Function(String)? onChanged;
  final bool readOnly;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
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
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              const Spacer(flex: 4),
              Expanded(
                flex: 10,
                child: TextField(
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardType,
                  onTap: onTap,
                  readOnly: readOnly,
                  onChanged: onChanged,
                  controller: controller,
                  style: const TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontSize: 15,

                    fontWeight: FontWeight.w500,
                    height: 1, // height cannot be 0 for TextField
                  ),
                  maxLines:
                      null, // allow TextField to expand and take up multiple lines
                  textAlign: TextAlign.right, // align text to the right
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
