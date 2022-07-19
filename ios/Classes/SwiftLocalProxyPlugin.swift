import Flutter
import UIKit

public class SwiftLocalProxyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "local_proxy", binaryMessenger: registrar.messenger())
        let instance = SwiftLocalProxyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "getProxySettings") {
            let systemProxySettings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() ?? [:] as CFDictionary
            result(systemProxySettings as NSDictionary)
            return
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
