import 'package:flutter/services.dart';

import 'screen_lock_checker_platform_interface.dart';

/// An implementation of [ScreenLockCheckerPlatform] that uses method channels.
class MethodChannelScreenLockChecker extends ScreenLockCheckerPlatform {
  /// The method channel used to interact with the native platform.
  final _channel = const MethodChannel('screen_lock_checker');

  @override
  Future<bool?> isScreenLockEnabled() {
    return _channel.invokeMethod('isScreenLockEnabled');
  }
}
