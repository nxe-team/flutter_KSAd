//
//  FlutterKSAdFeedManager.swift
//  flutter_ksad
//
//  Created by Anand on 2022/8/22.
//

import KSAdSDK

class FlutterKSAdFeedManager: NSObject, KSFeedAdsManagerDelegate {
    private let result: FlutterResult
    private let feedAdsManager: KSFeedAdsManager
    
    init(args: [String: Any], result: @escaping FlutterResult) {
        self.result = result
        feedAdsManager = KSFeedAdsManager(
            posId: args["posId"] as! String,
            size: CGSize(width: args["width"] as? CGFloat ?? UIScreen.main.bounds.width , height: 0))
        super.init()
        feedAdsManager.delegate = self
    }
    
    func loadAdData(count: Int) {
        feedAdsManager.loadAdData(withCount: count)
    }
    
    /// 信息流广告加载成功
    func feedAdsManagerSuccess(toLoad adsManager: KSFeedAdsManager, nativeAds feedAdDataArray: [KSFeedAd]?) {
        if feedAdDataArray == nil {
            result(FlutterError())
        }
        result(true)
    }
    
    /// 信息流广告加载失败
    func feedAdsManager(_ adsManager: KSFeedAdsManager, didFailWithError error: Error?) {
        
    }
}
