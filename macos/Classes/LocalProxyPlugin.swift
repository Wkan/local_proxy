import Cocoa
import FlutterMacOS
import SystemConfiguration

public class LocalProxyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "local_proxy", binaryMessenger: registrar.messenger)
        let instance = LocalProxyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getProxySettings":
            let proxySettings = SCDynamicStoreCopyProxies(nil) ?? [:] as CFDictionary
            result(proxySettings as NSDictionary)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
