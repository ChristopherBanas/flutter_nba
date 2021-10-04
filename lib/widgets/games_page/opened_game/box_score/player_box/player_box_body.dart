import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/player_box_score.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/player_box/player_box_cell.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:flutter_nba/globals.dart' as globals;

class PlayerBoxBody extends StatelessWidget {
  final gameEnums statDuration;
  final gameEnums team;

  const PlayerBoxBody({
    required this.statDuration,
    required this.team
  });

  @override
  Widget build(BuildContext context) {
    return Container();
    // List<PlayerBoxScore> mapList = globals.game.valueMap[gameEnums.PLAYER_BOX_SCORE][team][statDuration];
    // var headerList = mapList[0].valueMap.keys.toList().sublist(9, mapList[0].valueMap.keys.toList().length);
    // return Container(
    //   margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
    //   child: LazyDataTable(
    //       tableTheme: LazyDataTableTheme(
    //         cellColor: Colors.transparent,
    //         alternateCellColor: Colors.transparent,
    //         columnHeaderColor: Colors.transparent,
    //         cornerColor: Colors.transparent,
    //         rowHeaderColor: Colors.transparent,
    //         alternateRowHeaderColor: Colors.transparent,
    //         cellBorder: Border(
    //           top: BorderSide(color: Theme.of(context).dividerColor),
    //           bottom: BorderSide(color: Theme.of(context).dividerColor),
    //         ),
    //         alternateCellBorder: Border(
    //           top: BorderSide(color: Theme.of(context).dividerColor),
    //           bottom: BorderSide(color: Theme.of(context).dividerColor),
    //         ),
    //         alternateColumnHeaderBorder: Border(
    //             bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2)
    //         ),
    //         alternateRowHeaderBorder: Border(
    //             right: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
    //             top: BorderSide(color: Theme.of(context).dividerColor),
    //             bottom: BorderSide(color: Theme.of(context).dividerColor)
    //         ),
    //         columnHeaderBorder: Border(
    //             bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2)
    //         ),
    //         cornerBorder: Border(
    //           bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
    //           right: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
    //         ),
    //         rowHeaderBorder: Border(
    //             right: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
    //             top: BorderSide(color: Theme.of(context).dividerColor),
    //             bottom: BorderSide(color: Theme.of(context).dividerColor)
    //         ),
    //       ),
    //       tableDimensions: LazyDataTableDimensions(
    //         cellHeight: 10,
    //         cellWidth: 10,
    //         leftHeaderWidth: 10,
    //         topHeaderHeight: 10
    //       ),
    //       columns: headerList.length,
    //       rows: mapList.length,
    //     topHeaderBuilder: (i) => Align(
    //       alignment: Alignment.centerRight,
    //       child: Padding(
    //         padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
    //         child: Text(
    //           headerList[i].toString().split('.').last.replaceAll('_', ' '),
    //           textAlign: TextAlign.right,
    //         ),
    //       ),
    //     ),
    //     leftHeaderBuilder: (i) => Align(
    //       alignment: Alignment.centerRight,
    //       child: Text(
    //         mapList[i].valueMap['PLAYER_NAME']
    //       ),
    //     ),
    //     dataCellBuilder: (row, col) => PlayerBoxCell(data: mapList[row].valueMap.values.toList()[col]),
    //   ),
    // );
  }
}
