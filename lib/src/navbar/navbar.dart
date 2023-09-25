import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:using_riverpod/src/my_web_page.dart';
import 'package:using_riverpod/src/navbar/navbar_button.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileNavBar();
  }
}

class MobileNavBar extends HookConsumerWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final navbarColor = isScroll ? Colors.blue : Colors.white;
    final containerHeigth = useState<double>(0.0);
    final isExpanded = useState<bool>(false);
    return Stack(
      children: [
        AnimatedContainer(
          color: Colors.black,
          curve: Curves.ease,
          margin: const EdgeInsets.only(top: 80, bottom: 0),
          height: containerHeigth.value,
          duration: const Duration(
            milliseconds: 350,
          ),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NavbarButton(
                        onTap: () {
                          ref.read(currentPageProvider.notifier).state =
                              keyAboutUs;
                          containerHeigth.value = 0;
                          isExpanded.value = false;
                        },
                        text: 'About Us'),
                    NavbarButton(
                        onTap: () {
                          ref.read(currentPageProvider.notifier).state =
                              keyCoworkingKey;
                          containerHeigth.value = 0;
                          isExpanded.value = false;
                        },
                        text: 'Coworking Space'),
                    NavbarButton(
                        onTap: () {
                          ref.read(currentPageProvider.notifier).state =
                              keyOASIS;
                          containerHeigth.value = 0;
                          isExpanded.value = false;
                        },
                        text: 'OASIS'),
                    NavbarButton(
                        onTap: () {
                          ref.read(currentPageProvider.notifier).state =
                              keyMeeting;
                          containerHeigth.value = 0;
                          isExpanded.value = false;
                        },
                        text: 'Meeting Rooms'),
                    NavbarButton(
                        onTap: () {
                          ref.read(currentPageProvider.notifier).state =
                              keyMember;
                          containerHeigth.value = 0;
                          isExpanded.value = false;
                        },
                        text: 'Members'),
                    NavbarButton(
                        onTap: () {
                          ref.read(currentPageProvider.notifier).state =
                              keyContact;
                          containerHeigth.value = 0;
                          isExpanded.value = false;
                        },
                        text: 'Contact Us'),
                  ],
                ),
              ),
            ),
          ]),
        ),
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/Workville.png',
                  height: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      final double height =
                          containerHeigth.value > 0 ? 0.0 : 300;
                      containerHeigth.value = height;

                      isExpanded.value = !isExpanded.value;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0),
                        color: Colors.black,
                      ),
                      child: Icon(
                        isExpanded.value ? Icons.close : Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DesktopNavBar extends HookConsumerWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final navbarColor = isScroll ? Colors.blueAccent : Colors.white;

    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              'assets/Workville.png',
              height: 75,
            ),
            Expanded(
              child: Container(),
            ),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyAboutUs;
                },
                text: 'About Us'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state =
                      keyCoworkingKey;
                },
                text: 'Coworking Space'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyOASIS;
                },
                text: 'OASIS'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyMeeting;
                },
                text: 'Meeting Rooms'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyMember;
                },
                text: 'Members'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: const Color.fromRGBO(39, 207, 195, 1),
              ),
              onPressed: () {
                ref.read(currentPageProvider.notifier).state = keyContact;
              },
              child: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            const SizedBox(width: 40)
          ],
        ),
      ),
    );
  }
}
