import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 101, 58, 169);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.white,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length -1,
      'Colors must be between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      
    );
  }
}
