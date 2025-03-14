import 'package:flutter/material.dart';

class DropDownModel {
  int? id;
  String? name;
  List<DropDownModel>? subItems;
  Color? bgColor;
  Color? itemColor;

  DropDownModel({this.id, this.name, this.bgColor, this.itemColor, this.subItems});

  DropDownModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    bgColor = json['bgColor'];
    itemColor = json['itemColor'];
    subItems = json['subItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['name'] = name;
    data['bgColor'] = bgColor;
    data['itemColor'] = itemColor;
    data['subItems'] = subItems;
    return data;
  }
}
