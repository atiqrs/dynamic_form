import 'package:flutter/material.dart';

class PaddingDivider extends StatelessWidget {
  final Widget widget;
  final bool bottomPadding;

  const PaddingDivider({super.key, required this.widget, this.bottomPadding = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: bottomPadding ? 16 : 0),
          child: widget,
        ),
        Divider(thickness: 4, color: Colors.grey.shade300)
      ],
    );
  }
}
