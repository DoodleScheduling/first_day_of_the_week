import Flutter
import UIKit

public class FirstDayOfTheWeekPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "first_day_of_the_week", binaryMessenger: registrar.messenger())
    let instance = FirstDayOfTheWeekPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getFirstDayOfWeek":
      let firstWeekday = Calendar.current.firstWeekday
      result(firstWeekday)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
