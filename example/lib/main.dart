import 'package:flutter/material.dart';

import 'package:flutter_ksad/flutter_ksad.dart';
import 'package:flutter_ksad_example/config/ad_config.dart';
import 'package:flutter_ksad_example/page/feed_ad_page.dart';
import 'package:flutter_ksad_example/page/home_page.dart';

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
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/FeedAdPage': (context) => const FeedAdPage(),
      },
      initialRoute: '/HomePage',
    );
  }
}
