import 'package:flutter/widgets.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';

class AboutUs extends ResponsiveWidget {
  const AboutUs({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const ResponsiveAboutUs(
      paddingHorizontal: 200,
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const ResponsiveAboutUs(paddingHorizontal: 20);
  }
}

class ResponsiveAboutUs extends StatelessWidget {
  const ResponsiveAboutUs({super.key, required this.paddingHorizontal});
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isSmall = width < 1050 ? true : false;
    return Column(
      children: [
        Container(
          height: isSmall ? 0.5 * height : 250,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: isSmall
                  ? const AssetImage('assets/bannerAboutusSmall.png')
                  : const AssetImage('assets/bannerAboutus.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: const Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'OUR STORY',
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromRGBO(68, 68, 68, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'ABOVE AND BEYOND',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 129, 129, 129),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                maxLines: 4,
                "We're known as NYC's best boutique coworking space and daily meeting rooms and event  space provider because of our flexible, proactive management style, professional and friendly environment, and the top talent we attract. Here’s a look at what’s happening at Workville:",
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(60, 60, 60, 1)),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ))
      ],
    );
  }
}
