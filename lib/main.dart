import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nba/standings.dart';
import 'package:flutter_nba/menu_button.dart';
import 'package:flutter_nba/games.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Menu(onFlip: () => pageFlipKey.currentState?.flip()),
        body: Container(
            //color: Colors.white,
            child: PageFlipBuilder(
              key: pageFlipKey,
              frontBuilder: (_) => Scaffold(body: Center(child: GamesParallaxList(onFlip: () => pageFlipKey.currentState?.flip())),),
              backBuilder: (_) => ExampleBack(onFlip: () => pageFlipKey.currentState?.flip()),
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



