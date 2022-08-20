import 'package:flutter/material.dart';

class FeedAd extends StatefulWidget {
  const FeedAd({Key? key}) : super(key: key);

  @override
  _FeedAdState createState() => _FeedAdState();
}

class _FeedAdState extends State<FeedAd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('feed'),
    );
  }
}
