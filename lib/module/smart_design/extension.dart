import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get getSize => MediaQuery.of(this).size;
}

extension WidgetExtension on num {
  SizedBox get sbW => SizedBox(width: toDouble());
  SizedBox get sbH => SizedBox(height: toDouble());
}
