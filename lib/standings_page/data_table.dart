import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/enums.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class StandingsTable extends StatefulWidget {
  final List<Team> teams;
  final List<dynamic> headers;

  const StandingsTable({
    required this.teams,
    required this.headers
  });

  @override
  _StandingsTableState createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {
  // late double _scrollOffsetX;
  // late double _scrollOffsetY;

  @override
  void initState(){
    super.initState();
    // _scrollOffsetX = 0.0;
    // _scrollOffsetY = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return LazyDataTable(
      rows: widget.teams.length,
      columns: widget.headers.length,
      tableDimensions: LazyDataTableDimensions(
        cellHeight: 50,
        cellWidth: 100,
        topHeaderHeight: 50,
        leftHeaderWidth: 115,
      ),
      topHeaderBuilder: (i) => Align(alignment: Alignment.centerRight, child: Text(widget.headers[i].toString().split('.').last)),
      leftHeaderBuilder: (i) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.network(
                  'https://cdn.nba.com/logos/nba/${widget.teams[i].valueMap[teamEnums.teamId]}/primary/L/logo.svg'
              ),
            ),
            Text(widget.teams[i].valueMap[teamEnums.name]),
          ],

      ),
      dataCellBuilder: (row, col) => widget.headers.length <= 15 ?
          Align(alignment: Alignment.centerRight, child: Text('${widget.teams[row].valueMap[teamEnums.normalStats].valueMap.values.toList()[col]}'))
          : Align(alignment: Alignment.centerRight, child: Text('${widget.teams[row].valueMap[teamEnums.advancedStats].valueMap.values.toList()[col]}')),
      topLeftCornerWidget: Center(child: Text("")),
      tableTheme: LazyDataTableTheme(
        cellColor: Colors.transparent,
        alternateCellColor: Colors.transparent,
        columnHeaderColor: Colors.transparent,
        cornerColor: Colors.transparent,
        rowHeaderColor: Colors.transparent,
        alternateRowHeaderColor: Colors.transparent,
      ),
    );
    // return StickyHeadersTable(
    //   columnsLength: widget.headers.length,
    //   rowsLength: widget.teams.length,  // how many teams
    //   columnsTitleBuilder: (i) => Text(widget.headers[i].toString().split('.').last),
    //   rowsTitleBuilder: (i) => Text(widget.teams[i].valueMap[teamEnums.name]),
    //   contentCellBuilder: (col, row) => widget.headers.length <= 15 ?
    //     Text('${widget.teams[row].valueMap[teamEnums.normalStats].valueMap.values.toList()[col]}')
    //     : Text('${widget.teams[row].valueMap[teamEnums.advancedStats].valueMap.values.toList()[col]}'),
    //   legendCell: Text("Sticky"),
    //   initialScrollOffsetX: _scrollOffsetX,
    //   initialScrollOffsetY: _scrollOffsetY,
    //   onEndScrolling: (scrollOffsetX, scrollOffsetY) {
    //     _scrollOffsetX = scrollOffsetX;
    //     _scrollOffsetY = scrollOffsetY;
    //   },
    // );
  }
}

