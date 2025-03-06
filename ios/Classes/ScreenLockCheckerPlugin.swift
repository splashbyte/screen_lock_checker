import Flutter
import UIKit
import LocalAuthentication

public class ScreenLockCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_lock_checker", binaryMessenger: registrar.messenger())
    let instance = ScreenLockCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isScreenLockEnabled":
      let context = LAContext()
      var error: NSError?
      let isLocked = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
      result(isLocked)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
