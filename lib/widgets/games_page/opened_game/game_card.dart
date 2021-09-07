import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/widgets/games_page/opened_game/body.dart';

class GameCard extends StatelessWidget {
  final bool hidden;
  final ValueSetter updateHidden;

  const GameCard({
    required this.hidden,
    required this.updateHidden
  });

  @override
  Widget build(BuildContext context) {
    return hidden ? Container() :
    Dismissible(
      direction: DismissDirection.vertical,
      key: const Key('key'),
      onDismissed: (_) => updateHidden(true),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              TopRow(),
              MiddleRow(),
              OpenedGameBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Container(
      height: 50,
      width: 200,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}',
                style: TextStyle(
                  //fontSize: height / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '|',
                style: TextStyle(
                  //fontSize: height / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}',
                style: TextStyle(
                  //fontSize: height / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiddleRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 7.5),
      child: Container(
        height: 35,
        width: 300,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GAME',
                  style: TextStyle(
                    //fontSize: height / 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'BOX',
                  style: TextStyle(
                    //fontSize: height / 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
