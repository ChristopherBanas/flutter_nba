import 'package:flutter/material.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';

class ColorRow extends StatelessWidget {
  const ColorRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowChild(teamEnum: gameEnums.AWAY),
            RowChild(teamEnum: gameEnums.HOME),
          ],
        ),
      ),
    );
  }
}

class RowChild extends StatelessWidget {
  final gameEnums teamEnum;

  const RowChild({Key? key, required this.teamEnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color(globals.colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][teamEnum][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!),
            border: Border.all(
              color: Theme.of(context).textTheme.bodyText1!.color!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        Container(
          margin: teamEnum == gameEnums.AWAY ? const EdgeInsets.only(left: 5, right: 7)
              : const EdgeInsets.only(left: 5, right: 0),
          child: Text(
            globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][teamEnum][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}