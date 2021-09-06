import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';

class StickyScore extends StatelessWidget {

  Image getImage(id){
    return Image.network(
      'https://cdn.nba.com/logos/nba/$id/primary/L/logo.svg',
      height: 60,
      width: 60,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]),
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.PTS]}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.WL] == 'W' ?
                    FontWeight.bold : FontWeight.normal
                ),
              ),
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.PTS]}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.WL] == 'W' ?
                    FontWeight.bold : FontWeight.normal
                ),
              ),
              getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]),
            ],
          ),
        ),
      ),
    );
  }
}
