import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/globals.dart' as globals;

class QuarterTable extends StatelessWidget {

  Image getImage(id){
    return Image.network(
      'https://cdn.nba.com/logos/nba/$id/primary/L/logo.svg',
      height: 40,
      width: 40,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Center(
      child: DataTable(
        columnSpacing: 30,
        showCheckboxColumn: false,
        columns: const<DataColumn> [
          DataColumn(
            label: Text(""),
          ),
          DataColumn(
            label: Text("1"),
          ),
          DataColumn(
            label: Text("2"),
          ),
          DataColumn(
            label: Text("3"),
          ),
          DataColumn(
            label: Text("4"),
          ),
          DataColumn(
            label: Text("T"),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]),
                    Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}'),
                  ],
                ),
              ),
              DataCell(
                Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q1].valueMap[boxEnums.PTS]}')
              ),
              DataCell(
                  Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q2].valueMap[boxEnums.PTS]}')
              ),
              DataCell(
                  Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q3].valueMap[boxEnums.PTS]}')
              ),
              DataCell(
                  Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q4].valueMap[boxEnums.PTS]}')
              ),
              DataCell(
                  Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.PTS]}')
              ),
            ]
          ),
          DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]),
                      Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}'),
                    ],
                  ),
                ),
                DataCell(
                    Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q1].valueMap[boxEnums.PTS]}')
                ),
                DataCell(
                    Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q2].valueMap[boxEnums.PTS]}')
                ),
                DataCell(
                    Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q3].valueMap[boxEnums.PTS]}')
                ),
                DataCell(
                    Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q4].valueMap[boxEnums.PTS]}')
                ),
                DataCell(
                    Text('${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.PTS]}')
                ),
              ]
          ),
        ],
      ),
    );
  }
}
