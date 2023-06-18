import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Colors.red,
  Colors.black,
  Colors.blue,
  Colors.green,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
