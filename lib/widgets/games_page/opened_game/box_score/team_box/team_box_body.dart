import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/team_box/team_box_cell.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/team_box/team_table_header.dart';
class TeamBoxBody extends StatelessWidget {
  final gameEnums statDuration;
  
  const TeamBoxBody({
    required this.statDuration
  });

  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
        child: Table(
          border: TableBorder(
            verticalInside: BorderSide(width:  1, color: Colors.grey),
            horizontalInside: BorderSide(width:  1, color: Colors.grey),
          ),
          children: [
            TableRow(
              children: [
                TeamTableHeader(first: true),
                TeamTableHeader(first: false),
              ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.PTS, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.PTS, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.REB, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.REB, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.AST, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.AST, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.STL, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.STL, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.BLK, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.BLK, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.TOV, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.TOV, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FGM, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FGM, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FGA, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FGA, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FG_PCT, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FG_PCT, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FG3M, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FG3M, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FG3A, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FG3A, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FG3_PCT, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FG3_PCT, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FTM, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FTM, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FTA, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FTA, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.FT_PCT, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.FT_PCT, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.OREB, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.OREB, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.DREB, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.DREB, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.PF, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.PF, statDuration: statDuration)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.PLUS_MINUS, statDuration: statDuration),
                  TeamBoxCell(first: false, statType: boxEnums.PLUS_MINUS, statDuration: statDuration)
                ]
            ),
          ],
        ),
      ),
    );
  }
}
