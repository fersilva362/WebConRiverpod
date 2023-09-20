import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';

class ScreenShotContent extends ResponsiveWidget {
  const ScreenShotContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const ScreenshotContentResponsive(
      paddingHorizontal: 200,
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const ScreenshotContentResponsive(
      paddingHorizontal: 24,
    );
  }
}

class ScreenshotContentResponsive extends StatelessWidget {
  final double paddingHorizontal;

  const ScreenshotContentResponsive(
      {super.key, required this.paddingHorizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 48,
        ),
        child: Column(
          children: [
            const Text(
              'Basic Landing Web Page ScreenShot',
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
              child: const Text('description ScreenShot'),
            ),
            const SizedBox(
              height: 20,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _image(imageName: 'assets/appStore1.png'),
                  _image(imageName: 'assets/appStore1.png'),
                  _image(imageName: 'assets/appStore1.png'),
                  _image(imageName: 'assets/appStore1.png'),
                  _image(imageName: 'assets/appStore1.png'),
                  _image(imageName: 'assets/appStore1.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _image extends StatelessWidget {
  final String imageName;

  const _image({required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 16,
      ),
      Image.asset(imageName),
      const SizedBox(
        width: 16,
      )
    ]);
  }
}
