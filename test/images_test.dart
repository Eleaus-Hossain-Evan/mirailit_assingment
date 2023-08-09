import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mirailit_assingment/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.iconCategory).existsSync(), isTrue);
    expect(File(Images.iconHome).existsSync(), isTrue);
    expect(File(Images.iconProfile).existsSync(), isTrue);
  });
}
