import 'package:flutter/material.dart';

import '../title_text.dart';
import '../validation_text.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(dynamic data)? onSubmit;
  final String? hints, headerText;
  final TextStyle? headerStyle;

  const CustomDropdown(
      {super.key,
      required this.items,
      this.selectedItem,
      this.onSubmit,
      this.hints,
      this.headerText,
      this.headerStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (headerText != null) ...[
          TitleText(title: headerText ?? ''),
          ValidationText(valid: selectedItem != null),
          SizedBox(height: 8),
        ],
        DropdownButtonFormField(
          hint: Text(hints ?? 'Select'),
          value: selectedItem,
          isExpanded: true,
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              isCollapsed: true),
          icon: const Icon(Icons.keyboard_arrow_down),
          onChanged: onSubmit,
          items: items.map((title) {
            return DropdownMenuItem(
              value: title,
              child: Text(title),
            );
          }).toList(),
        ),
      ],
    );
  }
}
