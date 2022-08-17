//
//  FlutterKSAdSplashAd.swift
//  flutter_ksad
//
//  Created by Anand on 2022/8/17.
//

import KSAdSDK

/// 开屏广告
class FlutterKSAdSplashAd: NSObject, KSSplashAdViewDelegate {
    private let methodChannel: FlutterMethodChannel
    private let splashAd: KSSplashAdView
    
    init(messenger: FlutterBinaryMessenger, args: [String: Any]) {
        methodChannel = FlutterMethodChannel(
            name: FlutterKSAdChannel.splashAdChannelName,
            binaryMessenger: messenger)
        splashAd = KSSplashAdView(posId: args["posId"] as! String)
        super.init()
        splashAd.delegate = self
        splashAd.loadAdData()
    }
    
    private func postMessage(_ method: String, arguments: [String: Any]? = nil) {        methodChannel.invokeMethod(method, arguments: arguments)
    }
    
    func ksad_splashAdContentDidLoad(_ splashAdView: KSSplashAdView) {
        splashAdView.show(in: UIApplication.shared.keyWindow!)
    }
}
