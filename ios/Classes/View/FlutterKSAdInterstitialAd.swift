//
//  FlutterKSAdInterstitialAd.swift
//  flutter_ksad
//
//  Created by Anand on 2022/8/16.
//

import KSAdSDK

class FlutterKSAdInterstitialAd: NSObject, KSInterstitialAdDelegate {
    private var interstitialAd: KSInterstitialAd?
    
    init(_ args: [String: Any]) {
        super.init()
        interstitialAd = KSInterstitialAd(posId: args["posId"] as! String)
        interstitialAd?.delegate = self
        interstitialAd?.loadData()
    }
    
    func ksad_interstitialAdRenderSuccess(_ interstitialAd: KSInterstitialAd) {
        // FIXME: 统一获取 viewController
        self.interstitialAd?.show(from: UIApplication.shared.keyWindow!.rootViewController!)
    }
}


