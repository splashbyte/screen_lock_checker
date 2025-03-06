// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:screen_lock_checker/screen_lock_checker.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('isScreenLockEnabled test', (WidgetTester tester) async {
    final ScreenLockChecker plugin = ScreenLockChecker();
    await plugin.isScreenLockEnabled();
    // The version result depends on the host platform running the test, so
    // just assert that no error is thrown.
  });
}
