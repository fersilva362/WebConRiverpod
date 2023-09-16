import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
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

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          NavbarButton(onTap: () {}, text: 'Home'),
          NavbarButton(onTap: () {}, text: 'Feature'),
          NavbarButton(onTap: () {}, text: 'Screenshot'),
          NavbarButton(onTap: () {}, text: 'Contact'),
        ],
      ),
    );
  }
}
