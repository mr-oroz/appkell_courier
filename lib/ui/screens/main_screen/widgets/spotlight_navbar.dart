// ignore_for_file: library_private_types_in_public_api

import 'package:appkel_for_courier_flutter/ui/screens/main_screen/widgets/show_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'trapezium_painter.dart';

class SpotLightNavBar extends StatefulWidget {
  final List<Widget> items;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final ValueChanged<int> onItemPressed;
  final List<GlobalKey> keys = [];
  final Color selectedItemColor;
  final Color nonSelectedItemColor;
  final Color bottomNavBarColor;
  final Color? spotLightColor;
  final double? toolbarHeight;
  final BorderRadius? spotlightRadius;
  final Color? topLampLightColor;
  final Color? bottomLampLightColor;

  SpotLightNavBar({
    super.key,
    required this.items,
    this.animationDuration,
    this.animationCurve,
    required this.onItemPressed,
    required this.selectedItemColor,
    required this.nonSelectedItemColor,
    required this.bottomNavBarColor,
    this.spotLightColor,
    this.toolbarHeight,
    this.spotlightRadius,
    this.topLampLightColor,
    this.bottomLampLightColor,
  }) {
    for (int i = 0; i < items.length; i++) {
      keys.add(GlobalKey());
    }
  }

  @override
  _SpotLightNavBarState createState() => _SpotLightNavBarState();
}

class _SpotLightNavBarState extends State<SpotLightNavBar>
    with WidgetsBindingObserver {
  double? _spotLightPosition;
  double _opacity = 0.5;
  int _currentIndex = 0;
  int previousIndex = -1;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          _spotLightPosition = _getPosition();
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bottomNavBarColor,
      height: widget.toolbarHeight ?? 60,
      child: Stack(
        children: [
          AnimatedPositionedDirectional(
            duration:
                widget.animationDuration ?? const Duration(milliseconds: 0),
            curve: widget.animationCurve ?? Curves.decelerate,
            onEnd: () {
              setState(
                () {
                  _opacity = 0.23;
                  widget.onItemPressed(_currentIndex);
                },
              );
            },
            start: _spotLightPosition ?? 0,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.spotLightColor ?? Colors.white,
                    borderRadius:
                        widget.spotlightRadius ?? BorderRadius.circular(2),
                  ),
                  width: 45,
                  height: 3,
                ),
                SpotLightIndicator(
                  delay: 300,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _opacity,
                    child: Center(
                      child: SizedBox(
                        width: 30,
                        height: 57,
                        child: CustomPaint(
                          painter: LogoPainter(
                            topLampLightColor: widget.topLampLightColor ??
                                const Color(0xff777777).withOpacity(0.9),
                            bottomLampLightColor: widget.bottomLampLightColor ??
                                const Color(0xff777777).withOpacity(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.items
                  .asMap()
                  .map(
                    (int i, Widget iconItem) => MapEntry(
                      i,
                      Material(
                        color: Colors.transparent,
                        child: InkResponse(
                          radius: 40,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            RenderBox? box = widget.keys[i].currentContext
                                ?.findRenderObject() as RenderBox?;
                            if (box != null) {
                              Offset position = box.localToGlobal(Offset.zero);
                              setState(() {
                                var center = box.size.width / 6.6;
                                _spotLightPosition = position.dx + center;

                                if (_currentIndex != i) {
                                  _opacity = 0.0;
                                }

                                previousIndex = _currentIndex;
                                _currentIndex = i;
                              });
                              _resetOpacity();
                            }
                          },
                          key: widget.keys[i],
                          child: Center(
                            child: SizedBox(
                              width: 60,
                              child: IconTheme(
                                data: _currentIndex == i
                                    ? IconThemeData(
                                        color: widget.selectedItemColor,
                                      )
                                    : IconThemeData(
                                        color: widget.nonSelectedItemColor,
                                      ),
                                child: iconItem,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  double? _getPosition() {
    RenderBox? box =
        widget.keys[0].currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      Offset position = box.localToGlobal(Offset.zero);

      return position.dx;
    }
    return null;
  }

  void _resetOpacity() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 0.5;
      });
    });
  }
}
