import 'package:flutter/material.dart';

class FormData with ChangeNotifier {
  final String message;
  final String assignmentInstructionUrl;
  final String information;
  final JsonResponse jsonResponse;

  FormData({
    required this.message,
    required this.assignmentInstructionUrl,
    required this.information,
    required this.jsonResponse,
  });
}

class JsonResponse {
  final List<Attribute> attributes;

  JsonResponse({required this.attributes});
}

class Attribute {
  final String id;
  final String title;
  final String type;
  final List<String> options;
  final bool required;
  List<String> selected;

  Attribute({
    required this.id,
    required this.title,
    required this.type,
    required this.options,
    this.required = false,
    this.selected = const [],
  });
}