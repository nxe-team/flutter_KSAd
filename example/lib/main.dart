import 'package:flutter/material.dart';

import 'package:flutter_ksad/flutter_ksad.dart';
import 'package:flutter_ksad_example/config/ad_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterKsad.initSDK(appId: AdConfig.appId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  FlutterKsad.showInterstitialAd(
                      posId: AdConfig.interstitialId);
                },
                child: const Text('插屏广告'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('信息流广告'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
