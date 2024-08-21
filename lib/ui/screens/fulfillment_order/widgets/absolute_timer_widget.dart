import 'package:flutter/material.dart';

class AbsoluteTimerWidget extends StatefulWidget {
  final Duration duration;
  final VoidCallback onTimerEnd;
  final bool isRunning;
  final bool isCompleted;
  final ValueChanged<Duration>? onTimeUpdate;
  final Color backgroundColor;
  final Color color;

  const AbsoluteTimerWidget({
    Key? key,
    required this.duration,
    required this.onTimerEnd,
    this.isRunning = false,
    this.isCompleted = false,
    this.onTimeUpdate,
    this.backgroundColor = const Color(0xFFD9D9D9),
    this.color = const Color(0xFFFF6C29),
  }) : super(key: key);

  @override
  _AbsoluteTimerWidgetState createState() => _AbsoluteTimerWidgetState();
}

class _AbsoluteTimerWidgetState extends State<AbsoluteTimerWidget>
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
  void didUpdateWidget(AbsoluteTimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRunning && !oldWidget.isRunning) {
      _controller?.forward();
    }

    if (widget.duration != oldWidget.duration) {
      initAniationController();
    }
  }

  void initAniationController() {
    _remainingSeconds = widget.duration.inSeconds;

    if (_controller?.isAnimating == true) {
      _controller?.stop();
    }

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
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
