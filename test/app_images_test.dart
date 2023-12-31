import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tests/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.face).existsSync(), true);
    expect(File(AppImages.food1).existsSync(), true);
    expect(File(AppImages.food2).existsSync(), true);
    expect(File(AppImages.food3).existsSync(), true);
    expect(File(AppImages.food4).existsSync(), true);
    expect(File(AppImages.image).existsSync(), true);
    expect(File(AppImages.rose).existsSync(), true);
  });
}
