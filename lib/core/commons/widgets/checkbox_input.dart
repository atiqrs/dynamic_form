import 'package:dynamic_form/core/commons/widgets/title_text.dart';
import 'package:dynamic_form/core/resources/strings.dart';
import 'package:flutter/material.dart';

import 'validation_text.dart';

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
        TitleText(title: title),
        ValidationText(
          valid: selectedValues.isNotEmpty,
          showSuffix: true,
          suffixText: '${AppString.selectText} ${selectedValues.length}',
        ),
        SizedBox(height: 8),
        ...options.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: selectedValues.contains(option),
            onChanged: (bool? value) {
              onChanged(option);
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            dense: true,
          );
        }).toList(),
      ],
    );
  }
}
