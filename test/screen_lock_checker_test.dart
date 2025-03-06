import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screen_lock_checker/screen_lock_checker.dart';
import 'package:screen_lock_checker/screen_lock_checker_method_channel.dart';
import 'package:screen_lock_checker/screen_lock_checker_platform_interface.dart';

class MockScreenLockCheckerPlatform
    with MockPlatformInterfaceMixin
    implements ScreenLockCheckerPlatform {
  @override
  Future<bool?> isScreenLockEnabled() => Future.value(false);
}

void main() {
  final ScreenLockCheckerPlatform initialPlatform =
      ScreenLockCheckerPlatform.instance;

  test('$MethodChannelScreenLockChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenLockChecker>());
  });

  test('isScreenLockEnabled', () async {
    ScreenLockChecker screenLockCheckerPlugin = ScreenLockChecker();
    MockScreenLockCheckerPlatform fakePlatform =
        MockScreenLockCheckerPlatform();
    ScreenLockCheckerPlatform.instance = fakePlatform;

    expect(await screenLockCheckerPlugin.isScreenLockEnabled(), false);
  });
}
