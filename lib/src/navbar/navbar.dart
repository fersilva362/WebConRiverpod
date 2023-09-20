import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:using_riverpod/src/my_web_page.dart';
import 'package:using_riverpod/src/navbar/navbar_button.dart';
import 'dart:developer' as devtools show log;

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
    final isScroll = ref.watch(scrollProvider.notifier).state;
    final navbarColor = isScroll ? Colors.blue : Colors.white;
    final containerHeigth = useState<double>(0.0);
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.ease,
          margin: const EdgeInsets.only(top: 70, bottom: 0),
          height: containerHeigth.value,
          duration: const Duration(
            milliseconds: 350,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavbarButton(
                    onTap: () {
                      ref.read(currentPageProvider.notifier).state = keyHome;
                      containerHeigth.value = 0;
                    },
                    text: 'Home'),
                NavbarButton(
                    onTap: () {
                      ref.read(currentPageProvider.notifier).state = keyFeature;
                      containerHeigth.value = 0;
                    },
                    text: 'Feature'),
                NavbarButton(
                    onTap: () {
                      ref.read(currentPageProvider.notifier).state =
                          keyScreenShot;
                      containerHeigth.value = 0;
                    },
                    text: 'Screenshot'),
                NavbarButton(
                    onTap: () {
                      ref.read(currentPageProvider.notifier).state = keyContact;
                      containerHeigth.value = 0;
                    },
                    text: 'Contact'),
              ],
            ),
          ),
        ),
        Container(
          color: navbarColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/mindfulness1.png',
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Company name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 32,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Material(
                  child: InkWell(
                      onTap: () {
                        final double height =
                            containerHeigth.value > 0 ? 0.0 : 240;
                        containerHeigth.value = height;
                      },
                      splashColor: Colors.white70,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black54,
                      )),
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
    final isScroll = ref.watch(scrollProvider.notifier).state;
    final navbarColor = isScroll ? Colors.blueAccent : Colors.white;

    return Container(
      color: navbarColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image.asset(
              'assets/mindfulness1.png',
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Company name',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 32,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyHome;
                },
                text: 'Home'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyFeature;
                },
                text: 'Feature'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyScreenShot;
                },
                text: 'Screenshot'),
            NavbarButton(
                onTap: () {
                  ref.read(currentPageProvider.notifier).state = keyContact;
                },
                text: 'Contact'),
          ],
        ),
      ),
    );
  }
}
