import 'package:flutter/material.dart';

import '../../resources/strings.dart';

class ValidationText extends StatelessWidget {
  final bool valid;
  final bool showSuffix;
  final String suffixText;

  const ValidationText({
    super.key,
    this.showSuffix = false,
    this.suffixText = '',
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(valid ? Icons.check_circle : Icons.warning_amber_rounded,
            color: valid ? Colors.green : Colors.red.shade900, size: 18),
        SizedBox(width: 4),
        Text(AppString.requiredText,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: valid ? Colors.green : Colors.red.shade900)),
        if (showSuffix) Text(' . ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.grey)),
        SizedBox(width: 4),
        Text(suffixText, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
      ],
    );
  }
}
