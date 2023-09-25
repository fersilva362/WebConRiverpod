import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/button.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

const youtubeVideo =
    'https://workvillenyc.com/wp-content/themes/salient/img/WorkvilleFine_1080_V2.mp4';
final _webController = WebViewController()
  ..loadRequest(Uri.parse(youtubeVideo));

class Oasis extends ResponsiveWidget {
  const Oasis({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopOasis();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileOasis();
  }
}

class MobileOasis extends StatelessWidget {
  const MobileOasis({super.key});

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
          Expanded(
            child: TextBlock(
              width: width,
              height: 0.2 * height,
            ),
          ),
          SizedBox(
              height: 300,
              width: width,
              child: WebViewWidget(controller: _webController))
        ],
      ),
    );
  }
}

class DesktopOasis extends StatelessWidget {
  const DesktopOasis({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromRGBO(247, 247, 247, 1),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: TextBlock(width: 0.3 * width, height: height),
          ),
          Expanded(
            child: SizedBox(
                height: 400,
                width: 800,
                child: WebViewWidget(controller: _webController)),
          )
          //Expanded(child: Container())
        ],
      ),
    );
  }
}

class TextBlock extends StatelessWidget {
  const TextBlock({super.key, required this.width, required this.height});
  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final bool withTextDesk = width < 500 ? true : false;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            if (withTextDesk)
              const SizedBox(
                height: 15,
              ),
            const Text(
              'Private Full Floor Meeting Spaces & Rooftop',
              maxLines: 3,
              style: TextStyle(fontSize: 37.5, fontWeight: FontWeight.bold),
            ),
            if (withTextDesk)
              const SizedBox(
                height: 15,
              ),
            const Text(
              'Corporate Events, Off-Sites, Flexible Office & Social Gatherings',
              maxLines: 2,
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            if (withTextDesk)
              const SizedBox(
                height: 30,
              ),
            (withTextDesk)
                ? const Text(
                    'Welcome to OASIS.\n OASIS was created with your privacy, productivity, and your company’s personal goals in mind. Every OASIS floor features your own private floor, open desk workstations, conference areas with 65-inch display monitors, a kitchenette, a lounge, a cafe area, and two private bathrooms and Rooftop access.\n Guests can customize their experience with our exclusive catering or choose to do their own. Multiple floors can be booked to accommodate guests of 20 - 75. OASIS is perfect for your on-demand private office, company off-site meeting, brainstorming session, training session, executive meetings, and professional events, especially filming productions and photoshoots. OASIS Rooftop is perfect for any private gathering or special occasion.\n To learn more or make a reservation contact us at\n ',
                    //maxLines: null,
                    softWrap: true,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                : const Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Welcome to OASIS.\n OASIS was created with your privacy, productivity, and your company’s personal goals in mind. Every OASIS floor features your own private floor, open desk workstations, conference areas with 65-inch display monitors, a kitchenette, a lounge, a cafe area, and two private bathrooms and Rooftop access.\n Guests can customize their experience with our exclusive catering or choose to do their own. Multiple floors can be booked to accommodate guests of 20 - 75. OASIS is perfect for your on-demand private office, company off-site meeting, brainstorming session, training session, executive meetings, and professional events, especially filming productions and photoshoots. OASIS Rooftop is perfect for any private gathering or special occasion.\n To learn more or make a reservation contact us at\n ',
                        //maxLines: null,
                        softWrap: true,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
            TextButton(
              onPressed: () {},
              child: const Text('info@workvillenyc.com'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: ButtonGeneric(text: 'Get a quote')),
                SizedBox(width: 10),
                Expanded(child: ButtonGeneric(text: 'Request info')),
                SizedBox(width: 10),
                Expanded(child: ButtonGeneric(text: 'Video Tour')),
                SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
