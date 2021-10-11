import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  //accentColor: Color(0xffc8741c),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  appBarTheme: AppBarTheme(
      backgroundColor: Color(0xfff212121)
  ),
  scaffoldBackgroundColor: Color(0xfff3c3c3c),
  cardColor: Color(0xff565656),
  colorScheme: ColorScheme.dark(secondary: Color(0xff22a505)),
  tabBarTheme: TabBarTheme(indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Color(0xff22a505))))
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xfffEAE4DF),
    //accentColor: Color(0xffc8741c),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xfff2196f3)
    ),
    cardColor: Color(0xffFFFFFF)
);