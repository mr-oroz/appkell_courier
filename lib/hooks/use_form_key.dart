import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

GlobalKey<FormState> useFormKey({
  String? debugLabel,
}) {
  return useMemoized(() => GlobalKey<FormState>(debugLabel: debugLabel));
}
