import Flutter
import UIKit
import KSAdSDK

public class SwiftFlutterKsadPlugin: NSObject, FlutterPlugin {
    private var interstitialAd: FlutterKSAdInterstitialAd?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_ksad", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterKsadPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        switch call.method {
        case "initSDK":
            KSAdSDKManager.setLoglevel(KSAdSDKLogLevel.all)
            KSAdSDKManager.setAppId(args["appId"] as! String)
            result(true)
        case "showInterstitialAd":
            interstitialAd = FlutterKSAdInterstitialAd(args)
            result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
