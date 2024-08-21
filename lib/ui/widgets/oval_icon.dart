// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app.dart';

enum OvalIcons {
  privacy_policy,
}

class OvalIcon extends StatelessWidget {
  final OvalIcons icon;
  final double? size;
  final Color? color;
  final bool changeableColorAccordingToTheme;
  final double? positionTop;
  final double? positionRight;
  final double? positionBottom;
  final double? positionLeft;

  const OvalIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.changeableColorAccordingToTheme = false,
    this.positionTop,
    this.positionRight,
    this.positionBottom,
    this.positionLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 40,
      height: size ?? 40,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: App.appTheme(context).secondaryColor,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: positionTop,
            bottom: positionBottom,
            right: positionRight,
            left: positionLeft,
            child: Container(
              width: 14,
              height: 14,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                color: App.appTheme(context).greyColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svg/${icon.name}.svg',
            color: changeableColorAccordingToTheme
                ? Theme.of(context).colorScheme.onBackground
                : color,
          ),
        ],
      ),
    );
  }
}
