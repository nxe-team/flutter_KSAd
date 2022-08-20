import 'package:flutter/material.dart';
import 'package:flutter_ksad/flutter_ksad.dart';
import 'package:flutter_ksad_example/config/ad_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter KSAd Example'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                FlutterKsad.showSplashAd(posId: AdConfig.splashId);
              },
              child: const Text('开屏广告'),
            ),
            ElevatedButton(
              onPressed: () {
                FlutterKsad.showInterstitialAd(posId: AdConfig.interstitialId);
              },
              child: const Text('插屏广告'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/FeedAdPage');
              },
              child: const Text('信息流广告'),
            ),
          ],
        ),
      ),
    );
  }
}
