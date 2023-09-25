import 'package:flutter/widgets.dart';

abstract class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  Widget buildMobile(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1050) {
          return buildMobile(context);
        } else {
          return buildDesktop(context);
        }
      },
    );
  }
}
