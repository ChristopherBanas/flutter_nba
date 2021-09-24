import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/globals.dart' as globals;

class TeamBoxCell extends StatelessWidget {
  final bool first;
  final boxEnums statType;
  final gameEnums statDuration;

  const TeamBoxCell({
      required this.first,
      required this.statType,
      required this.statDuration
  });

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    var awayMap = game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][statDuration].valueMap;
    var homeMap = game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][statDuration].valueMap;
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          first ? StatTypeText(statType: statType.toString().split('.').last.replaceAll('_', ' '))
              : StatValueText(first: first, statValue: homeMap[statType].toString(),
              pct: statType.toString().split('.').last.contains("PCT")),
          first ? StatValueText(first: first, statValue: awayMap[statType].toString(),
              pct: statType.toString().split('.').last.contains("PCT"))
              : StatTypeText(statType: statType.toString().split('.').last.replaceAll('_', ' '))
        ],
      )
    );
  }
}

class StatTypeText extends StatelessWidget {
  final String statType;

  const StatTypeText({
    required this.statType
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      statType,
      style: TextStyle(
          fontSize: 10
      ),
    );
  }
}

class StatValueText extends StatelessWidget {
  final String statValue;
  final bool first;
  final bool pct;

  const StatValueText({
    required this.statValue,
    required this.first,
    required this.pct
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: first ? const EdgeInsets.fromLTRB(10, 0, 5, 0)
          : const EdgeInsets.fromLTRB(5, 0, 10, 0),
      child: Text(
        // if decimal format it
        pct ? '$statValue%' : statValue,
        style: TextStyle(
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

