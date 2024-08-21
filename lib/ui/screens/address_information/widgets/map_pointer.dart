import 'package:flutter/material.dart';

class MapPointer extends StatelessWidget {
  const MapPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 2,
            ),
          ),
        ),
        Container(
          width: 2,
          height: 10,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
