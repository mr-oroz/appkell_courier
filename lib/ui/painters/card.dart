import 'package:flutter/material.dart';

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height * 0.08241758);
    path.cubicTo(0, size.height * 0.03689956, size.width * 0.01348540, 0,
        size.width * 0.03012048, 0);
    path.lineTo(size.width * 0.9698795, 0);
    path.cubicTo(size.width * 0.9865141, 0, size.width,
        size.height * 0.03689962, size.width, size.height * 0.08241758);
    path.lineTo(size.width, size.height * 0.8296703);
    path.cubicTo(
        size.width,
        size.height * 0.8751868,
        size.width * 0.9865141,
        size.height * 0.9120879,
        size.width * 0.9698795,
        size.height * 0.9120879);
    path.lineTo(size.width * 0.03012048, size.height * 0.9120879);
    path.cubicTo(size.width * 0.01348540, size.height * 0.9120879, 0,
        size.height * 0.8751868, 0, size.height * 0.8296703);
    path.lineTo(0, size.height * 0.08241758);
    path.close();

    path.moveTo(size.width * 0.5010040, size.height);
    path.lineTo(size.width * 0.4723112, size.height * 0.8640110);
    path.lineTo(size.width * 0.5296968, size.height * 0.8640110);
    path.lineTo(size.width * 0.5010040, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
