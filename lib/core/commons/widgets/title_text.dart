import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }
}
