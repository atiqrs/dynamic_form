import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, dynamic> formValues;

  const ResultsScreen({super.key, required this.formValues});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text('${formValues.length} items', style: TextStyle(fontSize: 22)),
        )
      ]),
      body: ListView(
        children: formValues.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            subtitle: Text(entry.value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
