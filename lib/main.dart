import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/inherited_callback.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'themes.dart';
import 'widgets/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system; //initially is system default

  void callBack(theme){
    this.setState(() {
      themeMode = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InheritedCallBack(
        callBack: (theme) => callBack(theme),
        child: GetMaterialApp(
          title: "Flutter NBA",
          theme: lightTheme,
          themeMode: themeMode,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: LoadingScreen(),
        ),
      ),
    );
  }
}




