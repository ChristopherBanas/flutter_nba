import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/player_box_score.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/player_box/player_box_cell.dart';
import 'package:http/http.dart';
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
    List<PlayerBoxScore> mapList = globals.game.valueMap[gameEnums
        .PLAYER_BOX_SCORE][team][statDuration];
    List<boxEnums> headerList = [boxEnums.PLAYER_NAME];
    headerList.addAll(mapList[0].valueMap.keys.toList().sublist(9, mapList[0].valueMap.keys.toList().length));
    return SizedBox(
      height: 5000,
      width: double.infinity,
      child: LazyDataTable(
          tableTheme: LazyDataTableTheme(
            cellColor: Colors.transparent,
            alternateCellColor: Colors.transparent,
            columnHeaderColor: Colors.transparent,
            cornerColor: Colors.transparent,
            rowHeaderColor: Colors.transparent,
            alternateRowHeaderColor: Colors.transparent,
            cellBorder: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
            alternateCellBorder: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
            alternateColumnHeaderBorder: Border(
                bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2)
            ),
            alternateRowHeaderBorder: Border(
                right: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                top: BorderSide(color: Theme.of(context).dividerColor),
                bottom: BorderSide(color: Theme.of(context).dividerColor)
            ),
            columnHeaderBorder: Border(
                bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2)
            ),
            cornerBorder: Border(
              bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
              right: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
            ),
            rowHeaderBorder: Border(
                right: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                top: BorderSide(color: Theme.of(context).dividerColor),
                bottom: BorderSide(color: Theme.of(context).dividerColor)
            ),
          ),
          tableDimensions: LazyDataTableDimensions(
            cellHeight: 50,
            cellWidth: 50,
            leftHeaderWidth: 50,
            topHeaderHeight: 50
          ),
          columns: headerList.length-1,
          rows: mapList.length,
        topLeftCornerWidget: Text("NAME"),
        topHeaderBuilder: (i) => Text(
          headerList.sublist(1,headerList.length)[i].toString().split('.').last.replaceAll('_', ' '),
          textAlign: TextAlign.right,
        ),
        leftHeaderBuilder: (i) => PlayerText(mapList: mapList, headerList: headerList, row: i, col: 0),
        dataCellBuilder: (row, col) => PlayerText(mapList: mapList, headerList: headerList, row: row, col: col+1),
      ),
    );
  }
}

class PlayerText extends StatelessWidget {
  final List<PlayerBoxScore> mapList;
  final List<boxEnums> headerList;
  final int row;
  final int col;

  const PlayerText({
      required this.mapList,
      required this.headerList,
      required this.row,
      required this.col
  });

  @override
  Widget build(BuildContext context) {
    var base = mapList[row].valueMap[headerList[col]] ?? "N/A";
    return col == 0 ? Text(
        '${base.toString().split(" ")[0].substring(0,1).toString()}. ${base.toString().split(" ").sublist(1)[0].toString()}',
        style: TextStyle(
          fontSize: base.toString().split(" ").sublist(1)[0].toString().length > 11 ? 9 : 11
        ),
    )
        : headerList[col].toString().split('.').last.contains("PCT") ?
    Text(base == 'N/A' ? '$base' : '$base%')
        : Text('$base');
  }
}

