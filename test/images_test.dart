import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sushi_shop/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.caviarSushi).existsSync(), isTrue);
    expect(File(Images.maki).existsSync(), isTrue);
    expect(File(Images.philadelphmeiSushi).existsSync(), isTrue);
    expect(File(Images.threeCaviarSushi).existsSync(), isTrue);
    expect(File(Images.threePhiladelphmeiSushi).existsSync(), isTrue);
    expect(File(Images.twoMaki).existsSync(), isTrue);
  });
}
