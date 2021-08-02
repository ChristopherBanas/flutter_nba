import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nba/standings_page/standings.dart';
import 'package:flutter_nba/games_page/games.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import 'globals.dart';
import 'menu_button/menu_widget.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  final GamesParallaxList gamesList = GamesParallaxList(); //to prevent rebuilding all the time
  final ExampleBack standings = ExampleBack();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Menu(onFlip: () => pageFlipKey.currentState?.flip()),
        body: Container(
          child: PageFlipBuilder(
            key: pageFlipKey,
            frontBuilder: (_) => Scaffold(
              body: Center(
                  child: gamesList,
              ),
            ),
            backBuilder: (_) => standings,
            flipAxis: Axis.horizontal,
            interactiveFlipEnabled: false,
            nonInteractiveAnimationDuration: Duration(seconds: 1),
            maxScale: .05,
          ),
        ),
      ),
    );
  }
}




