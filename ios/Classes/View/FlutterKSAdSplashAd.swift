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
    
    /// 开屏广告请求加载完成
    func ksad_splashAdDidLoad(_ splashAdView: KSSplashAdView) {
        postMessage("onSplashAdLoadSuccess")
    }
    
    /// 开屏广告加载失败
    func ksad_splashAd(_ splashAdView: KSSplashAdView, didFailWithError error: Error) {
        postMessage("onSplashAdLoadFail")
        postMessage("onAdEnd")
        print("onSplashAdLoadFail \(error)")
    }
    
    /// 开屏广告内容准备完成，可以进行显示
    func ksad_splashAdContentDidLoad(_ splashAdView: KSSplashAdView) {
        splashAdView.show(in: UIApplication.shared.keyWindow!)
    }
    
    /// 开屏广告已显示
    func ksad_splashAdDidVisible(_ splashAdView: KSSplashAdView) {
        postMessage("onAdShow")
    }
    
    /// 开屏广告已关闭
    func ksad_splashAdDidClose(_ splashAdView: KSSplashAdView) {
        postMessage("onAdEnd")
    }
    
    /// 开屏广告被点击
    func ksad_splashAd(_ splashAdView: KSSplashAdView, didClick inMiniWindow: Bool) {
        postMessage("onAdClicked")
    }
    
    /// 开屏广告倒计时结束
    func ksad_splashAdDidAutoDismiss(_ splashAdView: KSSplashAdView) {
        postMessage("onAdDismiss")
    }
}
