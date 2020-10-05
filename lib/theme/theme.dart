import 'package:flutter/material.dart';

class AppTheme {
  static TextStyle _blackText = TextStyle(color: Colors.black);
  static TextStyle _whiteText = TextStyle(color: Colors.white);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
          headline6: _whiteText, bodyText1: _whiteText, bodyText2: _whiteText));
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      textTheme: TextTheme(
          headline6: _blackText, bodyText1: _blackText, bodyText2: _blackText));
}
