import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget screen;
  final SlideTo slideTo;
  SlideRoute({required this.screen, this.slideTo = SlideTo.right})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              screen,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: slideTo.value,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

enum SlideTo {
  left,
  right,
  top,
  bottom;

  Offset get value {
    switch (this) {
      case SlideTo.left:
        return const Offset(-1, 0);
      case SlideTo.right:
        return const Offset(1, 0);
      case SlideTo.top:
        return const Offset(0, -1);
      case SlideTo.bottom:
        return const Offset(0, 1);
    }
  }
}
