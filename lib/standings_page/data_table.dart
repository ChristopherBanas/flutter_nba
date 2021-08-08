import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/enums.dart';
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
  double _scrollOffsetX = 0.0;
  double _scrollOffsetY = 0.0;

  @override
  Widget build(BuildContext context) {
    return StickyHeadersTable(
      columnsLength: widget.headers.length,
      rowsLength: widget.teams.length,  // how many teams
      columnsTitleBuilder: (i) => Text(widget.headers[i].toString().split('.').last),
      rowsTitleBuilder: (i) => Text(widget.teams[i].valueMap[teamEnums.name]),
      contentCellBuilder: (col, row) => widget.headers.length <= 15 ?
        Text('${widget.teams[row].valueMap[teamEnums.normalStats].valueMap.values.toList()[col]}')
        : Text('${widget.teams[row].valueMap[teamEnums.advancedStats].valueMap.values.toList()[col]}'),
      legendCell: Text("Sticky"),
      initialScrollOffsetX: _scrollOffsetX,
      initialScrollOffsetY: _scrollOffsetY,
      onEndScrolling: (scrollOffsetX, scrollOffsetY) {
        _scrollOffsetX = scrollOffsetX;
        _scrollOffsetY = scrollOffsetY;
      },
    );
  }
}

