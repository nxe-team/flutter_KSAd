import Flutter
import UIKit
import KSAdSDK

public class SwiftFlutterKsadPlugin: NSObject, FlutterPlugin {
    private static var binaryMessenger: FlutterBinaryMessenger?
    private var splashAd: FlutterKSAdSplashAd?
    private var interstitialAd: FlutterKSAdInterstitialAd?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        binaryMessenger = registrar.messenger()
        let channel = FlutterMethodChannel(
            name: FlutterKSAdChannel.pluginChannelName,
            binaryMessenger: binaryMessenger!)
        let instance = SwiftFlutterKsadPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        // 信息流广告
        registrar.register(FlutterKSAdFeedAdFactory(messenger: binaryMessenger!), withId: "flutter_gromore_feed_ad")
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        switch call.method {
        case "initSDK":
            KSAdSDKManager.setLoglevel(KSAdSDKLogLevel.all)
            KSAdSDKManager.setAppId(args["appId"] as! String)
            result(true)
        case "showSplashAd":
            splashAd = FlutterKSAdSplashAd(
                messenger: SwiftFlutterKsadPlugin.binaryMessenger!,
                args: args)
            result(true)
        case "showInterstitialAd":
            interstitialAd = FlutterKSAdInterstitialAd(
                messenger: SwiftFlutterKsadPlugin.binaryMessenger!,
                args: args)
            result(true)
        case "loadFeedAd":
            FlutterKSAdFeedManager(args: args, result: result)
        case "removeFeedAd":
            if let feedId = args["feedId"] as? String {
                        FlutterGromoreFeedCache.removeAd(key: feedId)
                    }
                    result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
