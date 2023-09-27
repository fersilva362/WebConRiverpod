import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonGeneric extends StatelessWidget {
  final String text;
  final String nameRoute;
  const ButtonGeneric({super.key, required this.text, required this.nameRoute});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          context.goNamed(nameRoute);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromRGBO(39, 207, 195, 1),
          ),
          width: 150,
          height: 50,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
