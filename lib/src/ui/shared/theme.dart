import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.grey[850],
      accentColor: Colors.red[200],
      primaryColorDark: Colors.black45,
      fontFamily: 'Montserrat');
}
