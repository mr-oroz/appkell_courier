import 'package:flutter/material.dart';
import 'dart:math';

class RelativeTimerWidget extends StatefulWidget {
  final Duration duration;
  final Duration currentTime;
  final VoidCallback onTimerEnd;
  final bool isRunning;
  final bool isCompleted;
  final ValueChanged<Duration>? onTimeUpdate;
  final Color backgroundColor;
  final Color color;

  const RelativeTimerWidget({
    Key? key,
    required this.duration,
    required this.currentTime,
    required this.onTimerEnd,
    this.isRunning = false,
    this.isCompleted = false,
    this.onTimeUpdate,
    this.backgroundColor = const Color(0xFFD9D9D9),
    this.color = const Color(0xFFFF6C29),
  }) : super(key: key);

  @override
  _RelativeTimerWidgetState createState() => _RelativeTimerWidgetState();
}

class _RelativeTimerWidgetState extends State<RelativeTimerWidget>
    with TickerProviderStateMixin {
  late int _remainingSeconds;
  AnimationController? _controller;

  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    initAniationController();
  }

  @override
  void didUpdateWidget(RelativeTimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRunning && !oldWidget.isRunning) {
      _controller?.forward();
    }

    if (widget.duration != oldWidget.duration ||
        widget.currentTime != oldWidget.currentTime) {
      initAniationController();
    }
  }

  void initAniationController() {
    _remainingSeconds =
        max(0, widget.duration.inSeconds - widget.currentTime.inSeconds);

    if (_controller?.isAnimating == true) {
      _controller?.stop();
    }

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _remainingSeconds),
    );
    _startTime = DateTime.now();

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onTimerEnd();
      }
    });
    _controller!.addListener(() {
      setState(() {
        _remainingSeconds = widget.duration.inSeconds -
            DateTime.now().difference(_startTime).inSeconds;
        if (widget.onTimeUpdate != null) {
          widget.onTimeUpdate!(Duration(seconds: _remainingSeconds));
        }
      });
    });

    if (widget.isRunning) {
      _controller!.forward();
    }
  }

  void stopTimer() {
    widget.onTimerEnd();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: widget.isCompleted ? 1 : _controller?.value,
          backgroundColor: widget.backgroundColor,
          color: widget.color,
          borderRadius: BorderRadius.circular(100),
        ),
      ],
    );
  }
}
