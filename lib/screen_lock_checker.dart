import 'screen_lock_checker_platform_interface.dart';

/// A plugin for checking whether the device has a screen lock enabled.
class ScreenLockChecker {
  /// Returns whether the device has an enabled screen lock
  /// or [null] if it is unknown (e.g. too old Android version).
  Future<bool?> isScreenLockEnabled() {
    return ScreenLockCheckerPlatform.instance.isScreenLockEnabled();
  }
}
