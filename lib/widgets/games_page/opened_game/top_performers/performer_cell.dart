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
            : PerformerRow(performerEnum: performerEnum, statType: statType, first: false, homeAway: homeAway, index: index),
        first ? PerformerRow(performerEnum: performerEnum, statType: statType, first: true, homeAway: homeAway, index: index)
            : PictureCell(performerEnum: performerEnum, first: first, homeAway: homeAway, index: index)
      ],
    );
  }
}

class PerformerRow extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final bool first;
  final gameEnums homeAway;
  final int index;

  const PerformerRow({
    required this.performerEnum,
    required this.statType,
    required this.first,
    required this.homeAway,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: first ? const EdgeInsets.only(left: 5) : const EdgeInsets.only(right: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                first ? NameCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index)
                    : ValueCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index),
                first ? ValueCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index)
                    : NameCell(performerEnum: performerEnum, statType: statType, first: first, homeAway: homeAway, index: index)
              ],
            ),
            if (statType == boxEnums.PTS)
              PointsFooter(performerEnum: performerEnum, statType: statType, homeAway: homeAway, index: index, first: first)
            else if (statType == boxEnums.REB)
              ReboundsFooter(performerEnum: performerEnum, statType: statType, homeAway: homeAway, index: index, first: first)
            else
              AssistsFooter(performerEnum: performerEnum, statType: statType, homeAway: homeAway, index: index, first: first)
          ],
        ),
      ),
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
    String name = game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap[boxEnums.PLAYER_NAME]
        .toString().split(' ').sublist(1)[0].toString();
    return Text(
        name,
        style: TextStyle(
          fontSize: name.length > 11 ? 11 : 14
        ),
    ); //get last name
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
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
    );
  }
}

class PointsFooter extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final gameEnums homeAway;
  final int index;
  final bool first;

  const PointsFooter({
    required this.performerEnum,
    required this.statType,
    required this.homeAway,
    required this.index,
    required this.first,
  });

  @override
  Widget build(BuildContext context) {
    var map = globals.game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap;
    return Container(
        margin: const EdgeInsets.only(top: 1.5),
        child: Align(
          alignment: first ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            '${map[boxEnums.FGM]}-${map[boxEnums.FGA]} FGM, ${map[boxEnums.FG3M]}-${map[boxEnums.FG3A]} 3PM',
            style: TextStyle(
              fontSize: 10
            ),
          ),
        )
    );
  }
}

class ReboundsFooter extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final gameEnums homeAway;
  final int index;
  final bool first;

  const ReboundsFooter({
    required this.performerEnum,
    required this.statType,
    required this.homeAway,
    required this.index,
    required this.first,
  });

  @override
  Widget build(BuildContext context) {
    var map = globals.game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap;
    return Container(
        margin: const EdgeInsets.only(top: 1.5),
        child: Align(
          alignment: first ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            '${map[boxEnums.DREB]} DREB, ${map[boxEnums.OREB]} OREB',
            style: TextStyle(
                fontSize: 10
            ),
          ),
        )
    );
  }
}

class AssistsFooter extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;
  final gameEnums homeAway;
  final int index;
  final bool first;

  const AssistsFooter({
    required this.performerEnum,
    required this.statType,
    required this.homeAway,
    required this.index,
    required this.first,
  });

  @override
  Widget build(BuildContext context) {
    var map = globals.game.valueMap[gameEnums.TOP_PERFORMERS][homeAway][performerEnum][index].valueMap;
    return Container(
        margin: const EdgeInsets.only(top: 1.5),
        child: Align(
          alignment: first ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            '${map[boxEnums.TO]} TO',
            style: TextStyle(
                fontSize: 10
            ),
          ),
        )
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