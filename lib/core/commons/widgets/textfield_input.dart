import 'package:flutter/material.dart';

import 'title_text.dart';
import 'validation_text.dart';

class TextFieldInput extends StatefulWidget {
  final String title;
  final String? placeholder;
  final ValueChanged<String> onChanged;

  const TextFieldInput({
    super.key,
    required this.title,
    this.placeholder,
    required this.onChanged,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: widget.title),
        ValidationText(valid: widget.controller.text.trim().isNotEmpty),
        SizedBox(height: 8),
        TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
          ),
          controller: widget.controller,
          onChanged: (_) {
            _focusNode.focusInDirection(TraversalDirection.right);
          },
          onSubmitted: widget.onChanged,
          onTapOutside: (_) {
            widget.onChanged(widget.controller.text);
            _focusNode.unfocus();
          },
        ),
      ],
    );
  }
}
