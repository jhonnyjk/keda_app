import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.white,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 5,
  })  : assert(selectedColor >= 0, "Selected color must be greater then 0"),
        assert(selectedColor < colorList.length,
            "Selected color must be less or equal than ${colorList.length - 1}");

  ThemeData getAppTheme() => ThemeData(
        fontFamily: "Roboto",
        appBarTheme: AppBarTheme(centerTitle: true),
        colorSchemeSeed: colorList[selectedColor],
      );
}
