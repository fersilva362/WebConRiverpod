import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:developer' as devtools show log;

const youtubeVideo =
    'https://www.youtube.com/embed/qDl8F2MElms?si=B-wqxv0_6r653x8U';
final _webController = WebViewController()
  ..loadRequest(Uri.parse(youtubeVideo));

class FeatureContent extends ResponsiveWidget {
  const FeatureContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const FeatureContentsResponsive(paddingHorizontal: 200);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const FeatureContentsResponsive(
      paddingHorizontal: 20,
    );
  }
}

class FeatureContentsResponsive extends StatelessWidget {
  final double paddingHorizontal;

  const FeatureContentsResponsive({super.key, required this.paddingHorizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          const Text(
            'Basic Landing Web Page Feature',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: const Text('description Feature'),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 450,
              width: 800,
              color: Colors.red,
              child: WebViewWidget(controller: _webController))
        ],
      ),
    );
  }
}
