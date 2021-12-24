import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/widgets/games_page/inherited_call_back.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/opened_page.dart';
import 'package:flutter_nba/widgets/standings_page/standings_widget.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import '../globals.dart' as globals;
import 'games_page/games_widget.dart';
import 'menu_button/menu_widget.dart';
import 'package:flutter_nba/enums.dart';

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

  updateGameCard(Game selectedGame){
    globals.game = selectedGame;
    var awayId = selectedGame.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID];
    var homeId = selectedGame.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID];
    String awayBelong = globals.belongsTo[awayId]!;
    String homeBelong = globals.belongsTo[homeId]!;
    if(awayBelong == homeBelong && awayBelong != "none"){ //blue & blue or red & red
      globals.awayColor = Color(globals.secondaryColors[awayId]!);
    } else{
      globals.awayColor = Color(globals.primaryColors[awayId]!);
    }
    globals.homeColor = Color(globals.primaryColors[homeId]!);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OpenedPage())
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Menu(
          onFlip: () => {
            pageFlipKey.currentState?.flip(),
            globals.onScores = !globals.onScores
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
                  child: GamesWidget(
                      gamesList: widget.gamesList,
                  ),
                ),
              ),
              //GameCard(hidden: hidden, updateHidden: (hidden) => {updateHidden(hidden)})
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
