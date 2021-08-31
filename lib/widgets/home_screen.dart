import 'dart:core';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/widgets/standings_page/standings_widget.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
          body: SlidingUpPanel(
            body: Center(
              child: GamesWidget(gamesList: gamesList),
            ),
            header: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.grey,
                    ),
                  ]
              ),
              margin: const EdgeInsets.fromLTRB(100,50,100,0),
              child: Center(
                child: Text("Heading"),
              ),
            ),
            maxHeight: MediaQuery.of(context).size.height,
            renderPanelSheet: false,
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
              ),
              margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
              child: Center(
                child: Text(
                  "This is the collapsed Widget",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            panel: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.grey,
                    ),
                  ]
              ),
              margin: const EdgeInsets.fromLTRB(10,100,10,10),
              child: Center(
                child: Text("This is the SlidingUpPanel when open"),
              ),
            ),
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
