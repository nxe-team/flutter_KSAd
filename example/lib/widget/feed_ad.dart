import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ksad/view/ksad_feed_ad.dart';
import 'package:flutter_ksad_example/config/ad_config.dart';

class FeedAd extends StatelessWidget {
  final Map<String, dynamic> creationParams;

  const FeedAd({Key? key, required this.creationParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KSAdFeedAd(
      creationParams: creationParams,
    );
  }
}
