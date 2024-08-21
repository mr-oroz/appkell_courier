import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
    required this.discount,
    this.height = 29,
    this.width = 70,
    this.fontSize = 18,
    this.borderRadius = 8,
  });

  final int discount;
  final double height;
  final double width;
  final double fontSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFF30B800),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: Alignment.center,
      child: Text(
        '-$discount%',
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
