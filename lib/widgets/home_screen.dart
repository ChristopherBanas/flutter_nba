import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/widgets/database_models/game.dart';
import 'package:flutter_nba/widgets/standings_page/standings_widget.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import '../globals.dart';
import 'games_page/games_widget.dart';
import 'menu_button/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  final Map<String, dynamic> standingsMap;
  final List<Game> gamesList;

  HomeScreen({
    required this.standingsMap,
    required this.gamesList,
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
            child: GamesWidget(gamesList: gamesList),
          ),
        ),
        backBuilder: (_) => StandingsWidget(standingsMap: standingsMap),
        flipAxis: Axis.horizontal,
        interactiveFlipEnabled: false,
        nonInteractiveAnimationDuration: Duration(seconds: 1),
        maxScale: .05,
      ),
    );
  }
}
