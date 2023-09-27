import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

const tourVideo = 'https://player.vimeo.com/video/845537604?h=d11596ff22';
final _tourController = WebViewController()..loadRequest(Uri.parse(tourVideo));

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              context.goNamed('home');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logoBco.png',
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Container(
              padding: maxWidth > 1000
                  ? const EdgeInsets.symmetric(horizontal: 200)
                  : const EdgeInsets.all(0),
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: WebViewWidget(controller: _tourController))),
        ],
      ),
    );
  }
}
