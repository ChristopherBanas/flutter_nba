import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';

class PerformerCell extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final bool first;
  final gameEnums homeAway;
  final int index;

  const PerformerCell({
    required this.performerEnum,
    required this.statType,
    required this.first,
    required this.homeAway,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Row(
      children: [
        first ? Text('${game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[boxEnums.PLAYER_NAME]}')
             : Text('${game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[statType]}'),
        first ? Text('${game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[statType]}')
            : Text('${game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[boxEnums.PLAYER_NAME]}'),
      ],
    );
  }
}
