import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  final Map<String, List<String>> _formValues = {};

  Map<String, List<String>> get formValues => _formValues;

  void setValue(String id, List<String> value) {
    _formValues[id] = value;
    notifyListeners();
  }

  List<String>? getValues(String id) {
     return _formValues[id];
  }

  void toggleValue(String id, String value) {
    if (_formValues[id] == null) {
      _formValues[id] = [];
    }

    if (_formValues[id]!.contains(value)) {
      _formValues[id]!.remove(value);
    } else {
      _formValues[id]!.add(value);
    }
    notifyListeners();
  }

  bool validateForm() {
    for (var entry in _formValues.entries) {
      if (entry.value.isEmpty) {
        return false;
      }
    }
    return true;
  }
}
