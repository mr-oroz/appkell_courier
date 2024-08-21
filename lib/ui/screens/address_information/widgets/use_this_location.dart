import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UseThisLocation extends StatelessWidget {
  const UseThisLocation({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 190),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Поставьте метку на карте и укажите\nточное местоположение',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  const Gap(5),
                  TextButton.icon(
                    onPressed: onPressed,
                    // iconAlignment: IconAlignment.end,
                    label: const Text(
                      'Использовать этот пункт',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 14,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              child: Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: StarBorder(
                    points: 3,
                    innerRadiusRatio: 0.5,
                    rotation: 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
