import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/widgets/standings_page/standings_widget.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import '../globals.dart';
import 'games_page/games_widget.dart';
import 'menu_button/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  final GamesParallaxList gamesList = GamesParallaxList(); //to prevent rebuilding all the time
  final Map<String, dynamic> standingsMap;

  HomeScreen({
    required this.standingsMap
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Menu(
          onFlip: () => {
            pageFlipKey.currentState?.flip(),
            onScores = !onScores
          }
      ),
      body: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => Scaffold(
          body: Center(
            child: gamesList,
          ),
        ),
        backBuilder: (_) => Standings(standingsMap: standingsMap),
        flipAxis: Axis.horizontal,
        interactiveFlipEnabled: false,
        nonInteractiveAnimationDuration: Duration(seconds: 1),
        maxScale: .05,
      ),
    );
  }
}
