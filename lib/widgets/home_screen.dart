import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/widgets/games_page/inherited_call_back.dart';
import 'package:flutter_nba/widgets/games_page/game_card.dart';
import 'package:flutter_nba/widgets/standings_page/standings_widget.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import '../globals.dart';
import 'games_page/games_widget.dart';
import 'menu_button/menu_widget.dart';


class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> standingsMap;
  final List<Game> gamesList;

  const HomeScreen({
    required this.standingsMap,
    required this.gamesList,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  late Game selectedGame;
  bool hidden = true;

  updateGameCard(Game game){
    this.setState(() {
      selectedGame = game;
      hidden = false;
    });
  }

  updateHidden(bool hiddenVal){
    this.setState(() {
      hidden = hiddenVal;
    });
  }

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
          body: Stack(
            children: [
              Center(
                child: InheritedCallBack(
                  updateGameItem: (game) => {updateGameCard(game)},
                  updateHidden: (hidden) => {updateHidden(hidden)},
                  child: GamesWidget(
                      gamesList: widget.gamesList,
                  ),
                ),
              ),
              GameCard(hidden: hidden)
            ],
          ),
        ),
        backBuilder: (_) => StandingsWidget(standingsMap: widget.standingsMap),
        flipAxis: Axis.horizontal,
        interactiveFlipEnabled: false,
        nonInteractiveAnimationDuration: Duration(seconds: 1),
        maxScale: .05,
      ),
    );
  }
}
