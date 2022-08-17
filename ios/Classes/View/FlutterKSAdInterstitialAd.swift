//
//  FlutterKSAdInterstitialAd.swift
//  flutter_ksad
//
//  Created by Anand on 2022/8/16.
//

import Flutter
import KSAdSDK

class FlutterKSAdInterstitialAd: NSObject, KSInterstitialAdDelegate {
    private var methodChannel: FlutterMethodChannel
    private var interstitialAd: KSInterstitialAd
    
    init(messenger: FlutterBinaryMessenger, args: [String: Any]) {
        methodChannel = FlutterMethodChannel(
            name: FlutterKSAdChannel.interstitialAdChannelName,
            binaryMessenger: messenger)
        interstitialAd = KSInterstitialAd(posId: args["posId"] as! String)
        super.init()
        
        interstitialAd.delegate = self
        interstitialAd.loadData()
    }
    
    private func postMessage(_ method: String, arguments: [String: Any]? = nil) {        methodChannel.invokeMethod(method, arguments: arguments)
    }
    
    /// 插屏广告已显示
    func ksad_interstitialAdDidVisible(_ interstitialAd: KSInterstitialAd) {
        postMessage("onInterstitialShow")
    }
    
    /// 插屏广告渲染成功
    func ksad_interstitialAdRenderSuccess(_ interstitialAd: KSInterstitialAd) {
        // FIXME: 统一获取 viewController
        self.interstitialAd.show(from: UIApplication.shared.keyWindow!.rootViewController!)
    }
    
    /// 插屏广告渲染失败
    func ksad_interstitialAdRenderFail(_ interstitialAd: KSInterstitialAd, error: Error?) {
        postMessage("onInterstitialShowFail")
        print("interstitialAdRenderFail \(String(describing: error))")
    }
    
    /// 插屏广告被点击
    func ksad_interstitialAdDidClick(_ interstitialAd: KSInterstitialAd) {
        postMessage("onInterstitialAdClick")
    }
    
    /// 插屏广告已关闭
    func ksad_interstitialAdDidClose(_ interstitialAd: KSInterstitialAd) {
        postMessage("onInterstitialClosed")
    }
}
