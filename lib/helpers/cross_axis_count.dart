import 'package:flutter/material.dart';

int calculateCrossAxisCount(BuildContext context, double itemWidth) {
  double screenWidth = MediaQuery.of(context).size.width;
  int crossAxisCount = (screenWidth / itemWidth).floor();
  return crossAxisCount;
}
