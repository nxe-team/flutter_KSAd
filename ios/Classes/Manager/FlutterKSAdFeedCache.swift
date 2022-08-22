//
//  FlutterKSAdFeedCache.swift
//  flutter_ksad
//
//  Created by Anand on 2022/8/22.
//

import KSAdSDK

class FlutterKSAdFeedCache: NSObject {
    private static var ads: [String: KSFeedAd] = [:]
    
    static func addAd(_ ad: KSFeedAd) {
//        ads[ad.id] = ad
    }
    
    static func removeAd(key: String) {
        ads.removeValue(forKey: key)
    }
    
    static func getAd(key: String) -> KSFeedAd? {
        return ads[key]
    }
}
