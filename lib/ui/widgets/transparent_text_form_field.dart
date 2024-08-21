import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentTextFormField extends StatelessWidget {
  const TransparentTextFormField({
    super.key,
    required this.onChanged,
    required this.initialValue,
    required this.style,
    this.lengthLimiting,
    this.readOnly = false,
  });

  final Function(String) onChanged;
  final String initialValue;
  final TextStyle style;
  final int? lengthLimiting;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        if (lengthLimiting != null)
          LengthLimitingTextInputFormatter(lengthLimiting),
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      initialValue: initialValue,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
