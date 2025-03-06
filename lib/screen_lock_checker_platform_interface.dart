import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_lock_checker_method_channel.dart';

abstract class ScreenLockCheckerPlatform extends PlatformInterface {
  /// Constructs a ScreenLockCheckerPlatform.
  ScreenLockCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenLockCheckerPlatform _instance = MethodChannelScreenLockChecker();

  /// The default instance of [ScreenLockCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenLockChecker].
  static ScreenLockCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenLockCheckerPlatform] when
  /// they register themselves.
  static set instance(ScreenLockCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns whether the device has an enabled screen lock
  /// or [null] if it is unknown (e.g. too old Android version).
  Future<bool?> isScreenLockEnabled() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
