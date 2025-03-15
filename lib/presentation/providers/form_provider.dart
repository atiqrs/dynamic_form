import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  final Map<String, List<String>> _formValues = {};

  Map<String, List<String>> get formValues => _formValues;

  void setValueById(String id, List<String> value) {
    _formValues[id] = value;
    notifyListeners();
  }

  void setValue(Map<String, List<String>> value) {
    _formValues.clear();
    _formValues.addAll(value);
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
      if (entry.value.join(', ').isEmpty) {
        return false;
      }
    }
    return true;
  }
}
