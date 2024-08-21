import 'package:flutter/material.dart';

class PrimaryRoundedDivider extends StatelessWidget {
  const PrimaryRoundedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 46,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
