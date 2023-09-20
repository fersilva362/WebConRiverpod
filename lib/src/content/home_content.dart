import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';

final googlePlayUrl =
    Uri.parse('https://play.google.com/store/games?hl=en&gl=US');
final appStoreUrl = Uri.parse('https://www.apple.com/app-store/');

class HomeContent extends ResponsiveWidget {
  const HomeContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopHomeContainer();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileHomeContainer();
  }
}

class DesktopHomeContainer extends StatelessWidget {
  const DesktopHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.red,
      height: height * 0.65,
      child: Row(
        children: [
          Container(
              alignment: Alignment.bottomRight,
              width: width * 0.3,
              child: Image.asset('assets/chicaMeditandoPNG.png')),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Landing Web Page',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                const Text('description'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(appStoreUrl),
                      child: Image.asset(
                        'assets/appStore1.png',
                        width: 200,
                        height: 70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(googlePlayUrl),
                      child: Image.asset(
                        'assets/googlePlay1.png',
                        width: 200,
                        height: 60,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MobileHomeContainer extends StatelessWidget {
  const MobileHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: [
          const Text(
            'Basic Landing Web Page',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text('description'),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => launchUrl(appStoreUrl),
            child: Image.asset(
              'assets/appStore1.png',
              width: 200,
              height: 70,
            ),
          ),
          GestureDetector(
            onTap: () => launchUrl(googlePlayUrl),
            child: Image.asset(
              'assets/googlePlay1.png',
              width: 200,
              height: 60,
            ),
          ),
          SizedBox(
              height: 350, child: Image.asset('assets/chicaMeditandoPNG.png')),
        ],
      ),
    );
  }
}
