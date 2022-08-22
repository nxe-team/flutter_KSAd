//
//  FlutterKSAdFeedAd.swift
//  flutter_ksad
//
//  Created by Anand on 2022/8/20.
//

import Flutter
import KSAdSDK

class FlutterKSAdFeedAdFactory: NSObject, FlutterPlatformViewFactory {
    private let messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        FlutterKSAdFeedAd(frame: frame, id: viewId, args: args as! [String : Any], messenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        FlutterStandardMessageCodec.sharedInstance()
    }
}

class FlutterKSAdFeedAd: NSObject, FlutterPlatformView, KSFeedAdsManagerDelegate {
    private let feedAd: UIView
    private let feedAdsManager: KSFeedAdsManager
    
    func view() -> UIView {
        feedAd
    }
    
    init(frame: CGRect, id: Int64, args: [String: Any], messenger: FlutterBinaryMessenger) {
        feedAd = UIView(frame: frame)
        feedAdsManager = KSFeedAdsManager(posId: args["posId"] as! String, size: CGSize(width: UIScreen.main.bounds.size.width, height: 0))
        super.init()
        feedAdsManager.delegate = self
        feedAdsManager.loadAdData(withCount: 3)
        
    }
    
    func feedAdsManagerSuccess(toLoad adsManager: KSFeedAdsManager, nativeAds feedAdDataArray: [KSFeedAd]?) {
        if let feedView = feedAdDataArray?.first?.feedView {
            feedAd.addSubview(feedView)
        }
    }
}
