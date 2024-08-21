import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimatedIndicator extends StatelessWidget {
  const AnimatedIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AnimatedSmoothIndicator(
        count: count,
        activeIndex: activeIndex,
        effect: ExpandingDotsEffect(
          spacing: 5,
          dotWidth: 6,
          dotHeight: 6,
          expansionFactor: 6,
          dotColor: const Color(0xffd9d9d9),
          activeDotColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
