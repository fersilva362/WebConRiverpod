import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/image_block_generic.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:using_riverpod/src/Widget/button.dart';

List imageData = [
  'assets/outdoorTerrace.png',
  'assets/openDeskArea.png',
  'assets/openDeskArea.png',
  'assets/coffeArea.png'
];

class TextBlock extends StatelessWidget {
  const TextBlock({super.key, required this.width, required this.height});
  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NYC',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Coworking Space',
              style: TextStyle(fontSize: 32.5),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Private Offices, Conference Rooms & Outdoor Terraces',
              maxLines: 2,
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Workville is NYC’s best boutique coworking space and daily meeting room provider. If your team is in need of a short or long-term collaborative office or conference room, or just wants to host an occasional off-site, we have just what you need. Our inspiring environment creates a friendly and productive space. In addition to move-in-ready offices, meeting rooms, and individual workspaces with flexible terms, members can spread out to work from the cafes, lounges, and three outdoor terraces.',
              maxLines: null,
              style:
                  TextStyle(fontSize: 15, color: Color.fromRGBO(68, 68, 68, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonGeneric(text: 'Get a quote'),
                SizedBox(
                  width: 10,
                ),
                ButtonGeneric(text: 'Request info'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CoworkingSpace extends ResponsiveWidget {
  const CoworkingSpace({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopCoworkingSpace();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileCoworkingSpace();
  }
}

class MobileCoworkingSpace extends StatelessWidget {
  const MobileCoworkingSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      color: const Color.fromRGBO(247, 247, 247, 1),
      child: Column(
        children: [
          TextBlock(
            width: width,
            height: 0.2 * height,
          ),
          Expanded(
              child: ImageBlock(
            arrayImage: imageData,
          ))
        ],
      ),
    );
  }
}

class DesktopCoworkingSpace extends StatelessWidget {
  const DesktopCoworkingSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromRGBO(247, 247, 247, 1),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBlock(width: 0.3 * width, height: height),
          Expanded(
              child: ImageBlock(
            arrayImage: imageData,
          ))
        ],
      ),
    );
  }
}
