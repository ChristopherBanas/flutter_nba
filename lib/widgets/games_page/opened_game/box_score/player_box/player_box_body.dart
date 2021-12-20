import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/player_box_score.dart';
import 'package:flutter_nba/enums.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:flutter_nba/globals.dart' as globals;

class PlayerBoxBody extends StatelessWidget {
  final gameEnums statDuration;
  final gameEnums team;

  const PlayerBoxBody({
    required this.statDuration,
    required this.team
  });

  int getLongestName(List<PlayerBoxScore> nameMapList){
    int highest = 0;
    for(var i = 0; i < nameMapList.length; i++){
      var base = nameMapList[i].valueMap[boxEnums.PLAYER_NAME];
      String name = '${base.toString().split(" ")[0].substring(0,1).toString()}. ${base.toString().split(" ").sublist(1)[0].toString()}';
      if (name.length > highest){
        highest = name.length;
      }
    }
    return highest;
  }

  @override
  Widget build(BuildContext context) {
    List<PlayerBoxScore> mapList = globals.game.valueMap[gameEnums
        .PLAYER_BOX_SCORE][team][statDuration];
    List<boxEnums> headerList = [boxEnums.PLAYER_NAME];
    headerList.addAll(mapList[0].valueMap.keys.toList().sublist(8, mapList[0].valueMap.keys.toList().length));
    int highest = getLongestName(mapList);
    Color teamColor = Color(globals.colorMap[mapList[0].valueMap[boxEnums.TEAM_ID]]!);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 400,
      child: LazyDataTable(
          tableTheme: LazyDataTableTheme(
            cellColor: Colors.transparent,
            alternateCellColor: Theme.of(context).scaffoldBackgroundColor,
            columnHeaderColor: Colors.transparent,
            cornerColor: Colors.transparent,
            rowHeaderColor: Colors.transparent,
            alternateRowHeaderColor: Theme.of(context).scaffoldBackgroundColor,
            cellBorder: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
            alternateCellBorder: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
            alternateColumnHeaderBorder: Border(
                bottom: BorderSide(color: teamColor, width: 2)
            ),
            alternateRowHeaderBorder: Border(
                right: BorderSide(color: teamColor, width: 2),
                top: BorderSide(color: Theme.of(context).dividerColor),
                bottom: BorderSide(color: Theme.of(context).dividerColor)
            ),
            columnHeaderBorder: Border(
                bottom: BorderSide(color: teamColor, width: 2)
            ),
            cornerBorder: Border(
              bottom: BorderSide(color: teamColor, width: 2),
              right: BorderSide(color: teamColor, width: 2),
            ),
            rowHeaderBorder: Border(
                right: BorderSide(color: teamColor, width: 2),
                top: BorderSide(color: Theme.of(context).dividerColor),
                bottom: BorderSide(color: Theme.of(context).dividerColor)
            ),
          ),
          tableDimensions: LazyDataTableDimensions(
            cellHeight: 40,
            cellWidth: 50,
            topHeaderHeight: 40,
            leftHeaderWidth: 90+highest.toDouble(),
            customCellWidth: {0:40,1:30,2:30,3:30,4:50,5:35,6:35,7:50,8:30,9:30,10:50,11:35,
            12:30,13:30,14:30,15:30,16:30,17:20,18:20,19:50}
          ),
          columns: headerList.length-1,
          rows: mapList.length,
        topLeftCornerWidget: Center(),
        topHeaderBuilder: (i) => Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: i == headerList.length-2 ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(right: 0),
            child: Text(
              headerList.sublist(1,headerList.length)[i].toString().split('.').last.replaceAll('_', ' '),
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          ),
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
    return Align(
      alignment: col == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: col == 0 ? Container(
        margin: const EdgeInsets.only(left: 4),
        child: Text(
          '${base.toString().split(" ")[0].substring(0,1).toString()}. ${base.toString().split(" ").sublist(1)[0].toString()}',
          style: TextStyle(
              fontSize: base.toString().split(" ").sublist(1)[0].toString().length > 11 ? 9 : 11
          ),
        ),
      ) : headerList[col].toString().split('.').last.contains("PCT") ?
      Text(base == 'N/A' ? '$base' : '$base%',style: TextStyle(fontSize: 9))
          : Container(
            margin: col == headerList.length-1 ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(right: 0),
            child: Text('$base',style: TextStyle(fontSize: 9))
        )
    );
  }
}

