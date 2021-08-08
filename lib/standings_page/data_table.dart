import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/enums.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

Map<String, String> scriptMap = {
  '1': '\u00B9',
  '2': '\u00B2',
  '3': '\u00B3',
  '4': '\u2074',
  '5': '\u2075',
  '6': '\u2076',
  '7': '\u2077',
  '8': '\u2078',
  '9': '\u2079',
  '10': '\u00B9\u2070',
  '11': '\u00B9\u00B9',
  '12': '\u00B9\u00B2',
  '13': '\u00B9\u00B3',
  '14': '\u00B9\u2074',
  '15': '\u00B9\u2075',
  '16': '\u00B9\u2076',
  '17': '\u00B9\u2077',
  '18': '\u00B9\u2078',
  '19': '\u00B9\u2079',
  '20': '\u00B2\u2070',
  '21': '\u00B2\u00B9',
  '22': '\u00B2\u00B2',
  '23': '\u00B2\u00B3',
  '24': '\u00B2\u2074',
  '25': '\u00B2\u2075',
  '26': '\u00B2\u2076',
  '27': '\u00B2\u2077',
  '28': '\u00B2\u2078',
  '29': '\u00B2\u2079',
  '30': '\u00B3\u2070',
};

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: LazyDataTable(
        rows: widget.teams.length,
        columns: widget.headers.length,
        tableDimensions: LazyDataTableDimensions(
          cellHeight: 50,
          cellWidth: 100,
          topHeaderHeight: 50,
          leftHeaderWidth: 130,
        ),
        topHeaderBuilder: (i) => Align(
            alignment: Alignment.centerRight,
            child: Text(widget.headers[i].toString().split('.').last)
        ),
        leftHeaderBuilder: (i) => Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: Image.network(
                      'https://cdn.nba.com/logos/nba/${widget.teams[i].valueMap[teamEnums.teamId]}/primary/L/logo.svg',
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                child: Text('${widget.teams[i].valueMap[teamEnums.name]}${scriptMap['${i+1}']}'),
              ),
            ],
        ),
        dataCellBuilder: (row, col) => widget.headers.length <= 15 ?
            Align(
                alignment: Alignment.centerRight,
                child: Text('${widget.teams[row].valueMap[teamEnums.normalStats].valueMap.values.toList()[col]}')
            )
            : Align(
            alignment: Alignment.centerRight,
            child: Text('${widget.teams[row].valueMap[teamEnums.advancedStats].valueMap.values.toList()[col]}')
            ),
        topLeftCornerWidget: Center(child: Text("")),
        tableTheme: LazyDataTableTheme(
          cellColor: Colors.transparent,
          alternateCellColor: Colors.transparent,
          columnHeaderColor: Colors.transparent,
          cornerColor: Colors.transparent,
          rowHeaderColor: Colors.transparent,
          alternateRowHeaderColor: Colors.transparent,
        ),
      ),
    );
  }
}

