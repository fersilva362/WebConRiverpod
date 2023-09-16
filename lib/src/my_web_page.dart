import 'package:flutter/material.dart';
import 'package:using_riverpod/src/content/contact_content.dart';
import 'package:using_riverpod/src/content/feature_content.dart';
import 'package:using_riverpod/src/content/home_content.dart';
import 'package:using_riverpod/src/content/screenshot_content.dart';
import 'package:using_riverpod/src/navbar/navbar.dart';

class MyWebPage extends StatelessWidget {
  const MyWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: (maxWidth > 1200) ? 1200 : maxWidth,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
            ),
          ),
          child: const Column(
            children: [
              NavBar(),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeContent(),
                    FeatureContent(),
                    ScreenShotContent(),
                    ContactContent(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
