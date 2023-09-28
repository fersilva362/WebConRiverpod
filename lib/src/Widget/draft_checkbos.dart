import 'package:flutter/material.dart';

class NewCheckBox extends StatefulWidget {
  const NewCheckBox({super.key, required this.title});
  final String title;

  @override
  State<NewCheckBox> createState() => _NewCheckBoxState();
}

class _NewCheckBoxState extends State<NewCheckBox> {
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
            if (value != null) {
              isChecked = !value;
            }
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
