import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class StandingsTable extends StatefulWidget {
  final List<Team> teams;
  final int colLength;

  const StandingsTable({
    required this.teams,
    required this.colLength
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
      columnsLength: widget.colLength,
      rowsLength: widget.teams.length,  // how many teams
      columnsTitleBuilder: (i) => Text("Col"),
      rowsTitleBuilder: (i) => Text(widget.teams[i].name),
      contentCellBuilder: (i, j) => Text("Data"),
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

