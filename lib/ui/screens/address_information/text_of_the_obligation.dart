import 'package:flutter/material.dart';

class TextOfTheObligation extends StatelessWidget {
  const TextOfTheObligation({super.key, this.isObligatory = false});

  final bool isObligatory;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontSize: 12,
                  color: isObligatory ? Colors.red : const Color(0xFFA5A5A5),
                ),
              ),
              TextSpan(
                text: '${isObligatory ? '' : 'не'}объязательное поле',
                style: TextStyle(
                  fontSize: 12,
                  color: isObligatory ? Colors.red : const Color(0xFFA5A5A5),
                ),
              ),
            ],
          ),
        ));
  }
}
