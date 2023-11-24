import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:clinic_app/resources/resources.dart';

void main() {
  test('app_svgs assets test', () {
    expect(File(AppSvgs.addDoctor).existsSync(), true);
    expect(File(AppSvgs.article).existsSync(), true);
    expect(File(AppSvgs.car).existsSync(), true);
    expect(File(AppSvgs.myDoctors).existsSync(), true);
    expect(File(AppSvgs.profile).existsSync(), true);
  });
}
