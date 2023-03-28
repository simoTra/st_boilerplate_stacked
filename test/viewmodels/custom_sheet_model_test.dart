import 'package:flutter_test/flutter_test.dart';
import 'package:st_boilerplate_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CustomSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
