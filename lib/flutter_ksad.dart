import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKsad {
  static const MethodChannel _channel = MethodChannel('flutter_ksad');

  /// 初始化 SDK
  static Future<void> initSDK({required String appId}) async {
    await _channel.invokeMethod('initSDK', {
      'appId': appId,
    });
  }

  /// 显示开屏广告
  static Future<void> showSplashAd({required String posId}) async {
    await _channel.invokeMethod('showSplashAd', {
      'posId': posId,
    });
  }

  /// 显示插屏广告
  static Future<void> showInterstitialAd({required String posId}) async {
    await _channel.invokeMethod('showInterstitialAd', {
      /// 广告位 ID
      'posId': posId,
    });
  }
}
