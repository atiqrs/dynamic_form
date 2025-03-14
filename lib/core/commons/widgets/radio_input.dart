import 'package:flutter/material.dart';

class RadioInput extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const RadioInput({
    super.key,
    required this.title,
    required this.options,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        ...options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            selected: selectedValue == option,
            groupValue: selectedValue,
            onChanged: onChanged,
          );
        }),
      ],
    );
  }
}
