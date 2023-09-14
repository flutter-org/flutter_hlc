import 'package:flutter/material.dart';

enum ValueType {
  double,
  int,
}

class TextFieldModel {
  final String title;

  String get hintText => '请输入$title';
  final String unit;

  final TextEditingController controller;

  final ValueType valueType;

  dynamic get value {
    dynamic returnValue;
    switch (valueType) {
      case ValueType.double:
        returnValue = double.tryParse(controller.text);
        break;
      case ValueType.int:
        returnValue = int.tryParse(controller.text);
        break;
      default:
    }
    return returnValue;
  }

  TextFieldModel({
    required this.title,
    required this.unit,
    required this.controller,
    required this.valueType,
  });
}
