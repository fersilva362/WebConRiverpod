import 'package:flutter/material.dart';

class CheckBoxGeneric extends StatefulWidget {
  final String title;

  const CheckBoxGeneric({
    super.key,
    required this.title,
  });

  @override
  State<CheckBoxGeneric> createState() => _CheckBoxGenericState();
}

class _CheckBoxGenericState extends State<CheckBoxGeneric> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return null;
          }),
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.0, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}