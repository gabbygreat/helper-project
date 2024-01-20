import 'package:flutter/material.dart';
import 'package:tests/module/dark_mode/context_extension.dart';

GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class ThemeAppColor {
  final Color reactiveColor =
      navigator.currentContext!.getTheme.brightness == Brightness.dark
          ? Colors.black
          : Colors.red;
}
