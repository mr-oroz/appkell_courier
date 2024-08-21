import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../widgets/app_icon.dart';

class UploadImageContainer extends HookConsumerWidget {
  const UploadImageContainer(
      {super.key, this.fileName, this.onTap, required this.text, this.color});

  final String? fileName;
  final Function()? onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = useState<String?>(null);

    return FormField(validator: (value) {
      if (fileName == null) {
        errorText.value = 'Пожалуйста, загрузите файл';
      }
      return null;
    }, builder: (form) {
      return Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: fileName == null ? 48 : 80,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1,
                      color: errorText.value != null && fileName == null
                          ? Colors.redAccent
                          : color ?? const Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppIcon(
                        AppIcons.download,
                        color: color ?? const Color(0xFFAEAEAE),
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
                      Text(
                        text,
                        style:  TextStyle(
                          color: color ?? const Color(0xFFA4A4A4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  if (fileName != null) ...[
                    const Gap(15),
                    Text(
                      fileName!,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xFF222222),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (errorText.value != null && fileName == null) ...[
            const Gap(5),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  errorText.value!,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ]
        ],
      );
    });
  }
}
