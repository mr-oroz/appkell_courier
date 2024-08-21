import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  final Color topLampLightColor;
  final Color bottomLampLightColor;

  LogoPainter({
    required this.topLampLightColor,
    required this.bottomLampLightColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path quadPath = Path()
      ..moveTo(size.width * -0.19, 0)
      ..lineTo(size.width * 1.19, 0)
      ..lineTo(size.width * 1.4, size.height)
      ..lineTo(size.width * -0.4, size.height);

    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        topLampLightColor,
        bottomLampLightColor,
      ],
      stops: const [0.4, 0.5],
    );

    final Rect rect = Rect.fromCircle(
      center: const Offset(165.0, 50.0),
      radius: 180.0,
    );

    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawPath(quadPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
