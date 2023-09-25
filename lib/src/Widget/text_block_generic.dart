import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/button.dart';

class TextBlockGeneric extends StatelessWidget {
  const TextBlockGeneric(
      {super.key,
      required this.width,
      required this.height,
      required this.headline,
      required this.title,
      required this.subtitle,
      required this.text});
  final double width;
  final double? height;
  final String headline;
  final String title;
  final String subtitle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headline,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 37.5, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              subtitle,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              text,
              maxLines: null,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromRGBO(68, 68, 68, 1)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
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
