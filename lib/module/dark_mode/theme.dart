import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Brightness brightness;
  final Color textColor;

  CustomTheme({
    required this.textColor,
    required this.brightness,
  });

  @override
  ThemeExtension<CustomTheme> copyWith() {
    return CustomTheme(
      textColor: textColor,
      brightness: brightness,
    );
  }

  @override
  CustomTheme lerp(ThemeExtension<CustomTheme> other, double t) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme(
      brightness: other.brightness,
      textColor: other.textColor,
    );
  }
}

class AppTheme {
  static final AppTheme instance = AppTheme._init();
  AppTheme._init();

  final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    extensions: [
      CustomTheme(
        textColor: Colors.red,
        brightness: Brightness.dark,
      ),
    ],
  );

  final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    extensions: [
      CustomTheme(
        brightness: Brightness.light,
        textColor: Colors.black,
      ),
    ],
  );
}
