import 'package:flutter/material.dart';

class ButtonGeneric extends StatelessWidget {
  final String text;

  const ButtonGeneric({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
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
