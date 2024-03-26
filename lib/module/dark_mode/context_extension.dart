import 'package:flutter/material.dart';
import 'package:tests/module/dark_mode/theme.dart';

extension ContextExtension on BuildContext {
  CustomTheme get getTheme {
    return Theme.of(this).extension<CustomTheme>()!;
  }
}
