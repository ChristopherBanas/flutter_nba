import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  backgroundColor: Color(0xfff212121),
  appBarTheme: AppBarTheme(
      backgroundColor: Color(0xfff212121),
  ),
  scaffoldBackgroundColor: Color(0xfff3c3c3c),
  cardColor: Color(0xff565656),
  colorScheme: ColorScheme.dark(secondary: Color(0xff22a505)),
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xfffEAE4DF),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    backgroundColor: Color(0xfff2196f3),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xfff2196f3),
    ),
    cardColor: Color(0xffFFFFFF)
);