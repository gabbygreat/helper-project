import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tests/resources/resources.dart';

void main() {
  test('app_svg assets test', () {
    expect(File(AppSvg.accountCircle).existsSync(), true);
  });
}
