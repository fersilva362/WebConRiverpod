import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavbarButton extends HookConsumerWidget {
  final VoidCallback onTap;
  final String text;
  const NavbarButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textColor = useState<Color>(Colors.black);
    return MouseRegion(
      onEnter: (event) {
        textColor.value = Colors.blue;
      },
      onExit: (event) => textColor.value = Colors.black,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
