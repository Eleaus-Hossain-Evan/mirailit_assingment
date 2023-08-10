import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mirailit_assingment/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.banner1).existsSync(), isTrue);
    expect(File(Images.banner2).existsSync(), isTrue);
    expect(File(Images.banner3).existsSync(), isTrue);
    expect(File(Images.category1).existsSync(), isTrue);
    expect(File(Images.category2).existsSync(), isTrue);
    expect(File(Images.category3).existsSync(), isTrue);
    expect(File(Images.hotProduct1).existsSync(), isTrue);
    expect(File(Images.hotProduct2).existsSync(), isTrue);
    expect(File(Images.hotProduct3).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.newArrivalProduct1).existsSync(), isTrue);
    expect(File(Images.newArrivalProduct2).existsSync(), isTrue);
    expect(File(Images.newArrivalProduct3).existsSync(), isTrue);
    expect(File(Images.product1).existsSync(), isTrue);
    expect(File(Images.product2).existsSync(), isTrue);
    expect(File(Images.product3).existsSync(), isTrue);
    expect(File(Images.iconCategory).existsSync(), isTrue);
    expect(File(Images.iconHamburgerMenu).existsSync(), isTrue);
    expect(File(Images.iconHome).existsSync(), isTrue);
    expect(File(Images.iconProfile).existsSync(), isTrue);
    expect(File(Images.iconSearch).existsSync(), isTrue);
    expect(File(Images.iconVoice).existsSync(), isTrue);
    expect(File(Images.iconChevronRight).existsSync(), isTrue);
    expect(File(Images.iconTrophy).existsSync(), isTrue);
  });
}
