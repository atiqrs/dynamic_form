import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  DropdownInput({
    required this.title,
    required this.options,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}