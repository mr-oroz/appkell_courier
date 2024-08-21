import 'dart:io';

import 'package:flutter/material.dart';

class OfflineIndicator extends StatelessWidget {
  const OfflineIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: kBottomBarHeight,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.red,
        // padding: const EdgeInsets.only(bottom: 10),
        child: const Text(
          'Нет подключения к интернету',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

final kBottomBarHeight = Platform.isIOS ? 50.0 : 25.0;
