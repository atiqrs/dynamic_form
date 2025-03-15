import 'package:flutter/material.dart';

import '../../resources/strings.dart';
import 'title_text.dart';
import 'validation_text.dart';

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
        TitleText(title: title),
        ValidationText(
          valid: selectedValue != null,
          showSuffix: true,
          suffixText: '${AppString.selectText} 1',
        ),
        SizedBox(height: 8),
        ...options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            selected: selectedValue == option,
            groupValue: selectedValue,
            onChanged: onChanged,
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
          );
        }),
      ],
    );
  }
}
