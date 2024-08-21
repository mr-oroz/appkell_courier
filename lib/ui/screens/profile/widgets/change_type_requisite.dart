import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import '../../../../app/app.dart';
import '../../../widgets/app_icon.dart';

class ChangeTypeRequisite extends StatefulWidget {
  final int? sendType;
  final Function(int)? onTap;
  final Function(int) onSendTypeChanged;

  const ChangeTypeRequisite({
    Key? key,
    this.onTap,
    required this.sendType,
    required this.onSendTypeChanged,
  }) : super(key: key);

  @override
  State<ChangeTypeRequisite> createState() => _ChangeTypeRequisiteState();
}

class _ChangeTypeRequisiteState extends State<ChangeTypeRequisite>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!(widget.sendType ?? 0);
    }

    _controller
        .animateTo(1.0, duration: const Duration(milliseconds: 300))
        .then((_) {
      _controller.animateTo(0.0, duration: Duration.zero);

      final newSendType = widget.sendType == 1 ? 2 : 1;

      widget.onSendTypeChanged(newSendType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: App.appTheme(context).greyLightColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: const AppIcon(
                AppIcons.change_to,
                color: Color(0xFF191919),
                size: 16,
              ),
            ),
            const Gap(8),
            Text(
              widget.sendType == 2 ? 'Номер карты' : 'Номер телефона',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
