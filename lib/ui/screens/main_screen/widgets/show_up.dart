import 'dart:async';
import 'package:flutter/material.dart';

// TODO: Что это за класс? Что он делает? Как он работает? Нвзвание не говорит ничего
class SpotLightIndicator extends StatefulWidget {
  final Widget child;
  final int delay;

  const SpotLightIndicator({
    super.key,
    required this.child,
    required this.delay,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SpotLightIndicatorState createState() => _SpotLightIndicatorState();
}

class _SpotLightIndicatorState extends State<SpotLightIndicator> with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final curve = CurvedAnimation(
      curve: Curves.fastLinearToSlowEaseIn,
      parent: _animController,
    );
    _animOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: Offset.zero,
    ).animate(curve);

    Timer(
      Duration(milliseconds: widget.delay),
      () {
        _animController.forward();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        textDirection: TextDirection.rtl,
        child: widget.child,
      ),
    );
  }
}
