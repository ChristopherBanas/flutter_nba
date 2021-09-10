import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/top_performers/performer_cell.dart';

class PerformerTable extends StatelessWidget {
  final boxEnums performerEnum;
  final boxEnums statType;

  const PerformerTable({
    required this.performerEnum,
    required this.statType
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: DataTable(
          columnSpacing: 40,
          showCheckboxColumn: false,
          columns: const<DataColumn> [
            DataColumn(
              label: Text(""),
            ),
            DataColumn(
              label: Text(""),
            ),
          ],
          rows: [
            DataRow(
                cells: [
                  DataCell(
                    PerformerCell(
                        performerEnum: performerEnum,
                        statType: statType,
                        first: true,
                        homeAway: gameEnums.AWAY,
                        index: 0,
                    )
                  ),
                  DataCell(
                      PerformerCell(
                          performerEnum: performerEnum,
                          statType: statType,
                          first: false,
                          homeAway: gameEnums.HOME,
                          index: 0,
                      )
                  ),
                ]
            ),
            DataRow(
                cells: [
                  DataCell(
                      PerformerCell(
                        performerEnum: performerEnum,
                        statType: statType,
                        first: true,
                        homeAway: gameEnums.AWAY,
                        index: 1,
                      )
                  ),
                  DataCell(
                      PerformerCell(
                        performerEnum: performerEnum,
                        statType: statType,
                        first: false,
                        homeAway: gameEnums.HOME,
                        index: 1,
                      )
                  ),
                ]
            ),
            DataRow(
                cells: [
                  DataCell(
                      PerformerCell(
                        performerEnum: performerEnum,
                        statType: statType,
                        first: true,
                        homeAway: gameEnums.AWAY,
                        index: 2,
                      )
                  ),
                  DataCell(
                      PerformerCell(
                        performerEnum: performerEnum,
                        statType: statType,
                        first: false,
                        homeAway: gameEnums.HOME,
                        index: 2,
                      )
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
