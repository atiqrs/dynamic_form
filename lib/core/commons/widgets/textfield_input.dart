import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final String title;
  final String? placeholder;
  final ValueChanged<String> onChanged;

  TextFieldInput({
    required this.title,
    this.placeholder,
    required this.onChanged,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
          ),
          controller: controller,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
