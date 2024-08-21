import 'package:flutter/material.dart';

import '../../../widgets/app_icon.dart';

class LoginWithExternalProvider extends StatelessWidget {
  const LoginWithExternalProvider({
    super.key,
    this.iconName,
    this.onTap,
    this.text,
    this.isLoading = false,
    this.image,
    this.appIconColor,
  });

  final String? text;
  final AppIcons? iconName;
  final Color? appIconColor;
  final Function()? onTap;
  final bool isLoading;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                ] else if (text != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      text!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            if (iconName != null && !isLoading)
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppIcon(
                    iconName!,
                    color: appIconColor,
                  ),
                ),
              ),
            if (image != null && !isLoading)
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: image,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
