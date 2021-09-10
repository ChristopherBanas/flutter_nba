import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        first ? PictureCell(performerEnum: performerEnum, first: first, homeAway: homeAway, index: index)
            : ValueCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index),
        NameCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index),
        first ? ValueCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index)
            : PictureCell(performerEnum: performerEnum, first: first, homeAway: homeAway, index: index)
      ],
    );
  }
}

class NameCell extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final bool first;
  final gameEnums homeAway;
  final int index;

  const NameCell({
    required this.performerEnum,
    required this.statType,
    required this.first,
    required this.homeAway,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Text('${game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[boxEnums.PLAYER_NAME]
        .toString().split(' ').sublist(1)[0].toString()}'); //get last name
  }
}

class ValueCell extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final bool first;
  final gameEnums homeAway;
  final int index;

  const ValueCell({
    required this.performerEnum,
    required this.statType,
    required this.first,
    required this.homeAway,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Text(
        '${game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[statType]}',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
    );
  }
}

class PictureCell extends StatelessWidget {
  final boxEnums performerEnum;
  final bool first;
  final gameEnums homeAway;
  final int index;

  const PictureCell({
    required this.performerEnum,
    required this.first,
    required this.homeAway,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    var id = game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[boxEnums.PLAYER_ID];
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 20.5,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).cardColor,
          child: ClipOval(
            child: Image.network(
              'https://cdn.nba.com/headshots/nba/latest/1040x760/$id.png',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }
}



