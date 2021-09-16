import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/enums.dart';

class CardScore extends StatelessWidget {
  final bool isHome;
  final Game game;
  final double height;

  const CardScore({
    required this.isHome,
    required this.game,
    required this.height
  });

  Image getImage(id){
    return Image.asset(
      'assets/images/$id.png',
      height: height / 4.5,
      width: height / 4.5,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isHome ?
        WinLoss(value: game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.WL], height: height) :
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]),
        ),
        Padding(
          padding: isHome ? const EdgeInsets.fromLTRB(10, 5, 5, 5) : const EdgeInsets.fromLTRB(5, 5, 10, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][isHome ? gameEnums.HOME : gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.PTS]}',
                style: TextStyle(
                  fontSize: height / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][isHome ? gameEnums.HOME : gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}',
                style: TextStyle(
                    fontSize: height / 12,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
        isHome ? Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]),
        ) :
        WinLoss(value: game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.WL], height: height)
      ],
    );
  }
}

class WinLoss extends StatelessWidget {
  final String value;
  final double height;

  const WinLoss({
    required this.value,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        value,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: value == 'W' ? Colors.green : Colors.red,
            fontSize: height / 8
        )
    );
  }

}

