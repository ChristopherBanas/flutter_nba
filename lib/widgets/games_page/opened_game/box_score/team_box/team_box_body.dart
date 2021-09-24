import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/team_box/team_box_cell.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/team_box/team_table_header.dart';
class TeamBoxBody extends StatelessWidget {
  const TeamBoxBody({Key? key}) : super(key: key);

  

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
                  TeamBoxCell(first: true, statType: boxEnums.PTS, statDuration: gameEnums.TOTAL),
                  TeamBoxCell(first: false, statType: boxEnums.PTS, statDuration: gameEnums.TOTAL)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.REB, statDuration: gameEnums.TOTAL),
                  TeamBoxCell(first: false, statType: boxEnums.REB, statDuration: gameEnums.TOTAL)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.AST, statDuration: gameEnums.TOTAL),
                  TeamBoxCell(first: false, statType: boxEnums.AST, statDuration: gameEnums.TOTAL)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.STL, statDuration: gameEnums.TOTAL),
                  TeamBoxCell(first: false, statType: boxEnums.STL, statDuration: gameEnums.TOTAL)
                ]
            ),
            TableRow(
                children: [
                  TeamBoxCell(first: true, statType: boxEnums.BLK, statDuration: gameEnums.TOTAL),
                  TeamBoxCell(first: false, statType: boxEnums.BLK, statDuration: gameEnums.TOTAL)
                ]
            ),
          ],
        ),
      ),
    );
  }
}
