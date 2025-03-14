import 'package:flutter/material.dart';

class CheckboxInput extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String> selectedValues;
  final ValueChanged<String> onChanged;

  CheckboxInput({
    required this.title,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        ...options.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: selectedValues.contains(option),
            onChanged: (bool? value) {
              onChanged(option);
            },
          );
        }).toList(),
      ],
    );
  }
}