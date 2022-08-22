import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KSAdFeedAd extends StatefulWidget {
  static const String viewType = 'flutter_gromore_feed_ad';

  final Map<String, dynamic> creationParams;

  const KSAdFeedAd({Key? key, required this.creationParams}) : super(key: key);

  @override
  State<KSAdFeedAd> createState() => _KSAdFeedAdState();
}

class _KSAdFeedAdState extends State<KSAdFeedAd> {
  double _height = 0;

  Future<void> methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'onRenderSuccess':
        setState(() {
          _height = call.arguments['height'];
        });
        break;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) return const SizedBox.shrink();

    return SizedBox(
      height: _height,
      child: UiKitView(
        viewType: KSAdFeedAd.viewType,
        creationParams: widget.creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (int id) {
          MethodChannel('${KSAdFeedAd.viewType}/$id')
              .setMethodCallHandler(methodCallHandler);
        },
      ),
    );
  }
}
