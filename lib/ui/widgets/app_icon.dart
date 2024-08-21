// ignore_for_file: constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  call,
  google,
  apple,
  courier_illustration,
  shop,
  arrow_down,
  briefcase,
  sms,
  location,
  download,
  key,
  eya_closed,
  eya_open,
  user,
  change_to,
  home,
  element_equal,
  box,
  camera,
  notification,
  arrow_down_vertical,
  search,
  my_products,
  loading,
  bag_tick,
  address_illustration,
  cancel,
  arrow_right,
  upload,
  delete,
  warning,
  refusal,
  image_plus,
  camera_plus,
  check_circle
}

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final double? size;
  final Color? color;
  final bool changeableColorAccordingToTheme;

  const AppIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.changeableColorAccordingToTheme = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset(
        'assets/svg/${icon.name}.svg',
        color: changeableColorAccordingToTheme
            ? Theme.of(context).colorScheme.onBackground
            : color,
        height: size,
        width: size,
      ),
    );
  }
}
