import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:clinic_app/resources/resources.dart';

void main() {
  test('app_pngs assets test', () {
    expect(File(AppPngs.analys).existsSync(), true);
    expect(File(AppPngs.bell).existsSync(), true);
    expect(File(AppPngs.car).existsSync(), true);
    expect(File(AppPngs.clipboard).existsSync(), true);
    expect(File(AppPngs.hospital).existsSync(), true);
    expect(File(AppPngs.speech).existsSync(), true);
  });
}
