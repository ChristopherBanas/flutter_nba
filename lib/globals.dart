import 'package:flutter/material.dart';


bool onScores = true;


ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xfff212121)
    ),
    scaffoldBackgroundColor: Color(0xfff3c3c3c),
    cardColor: Color(0xff565656),
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xfff2196f3)
    ),
    cardColor: Color(0xffFFFFFF)
);
