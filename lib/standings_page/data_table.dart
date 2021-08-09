import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/enums.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

Map<String, String> scriptMap = { //for super script
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
  final bool normal;

  const StandingsTable({
    required this.teams,
    required this.headers,
    required this.normal
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
          customCellWidth: widget.normal ? {} : {0:50, 1:50, 2:125, 3:125, 4:100, 5:100, 6:95, 7:95, 8:80, 9:90, 10:80, 11:60, 12:85, 13:70, 14: 85, 15:110, 16: 95, 17:70, 18:100, 19:100, 20:80, 21:60, 22:60, 23: 50, 24:50, 25:50, 26:55, 27:55, 28:50, 29:50, 30:50, 31:50, 32:50, 33:50, 34:50, 35:50},
          cellWidth: widget.normal ? 50 : 125,
          leftHeaderWidth: 120,
        ),
        topHeaderBuilder: (i) => Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 1, 2, 0),
              child: Text(
                widget.headers[i].toString().split('.').last.replaceAll('_', ' '),
                textAlign: TextAlign.right,
              ),
            )
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
        dataCellBuilder: (row, col) => widget.normal?
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                  child: Text('${widget.teams[row].valueMap[teamEnums.normalStats].valueMap.values.toList()[col]}'),
                )
            ) :
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                  child: Text(
                      '${widget.teams[row].valueMap[teamEnums.advancedStats].valueMap.values.toList()[col]}',
                      textAlign: TextAlign.right,
                  ),
                )
            ),
        topLeftCornerWidget: Center(child: Text("")),
        tableTheme: LazyDataTableTheme(
          cellColor: Colors.transparent,
          alternateCellColor: Colors.transparent,
          columnHeaderColor: Colors.transparent,
          cornerColor: Colors.transparent,
          rowHeaderColor: Colors.transparent,
          alternateRowHeaderColor: Colors.transparent,
          cellBorder: Border.all(color: Colors.grey.shade800),
          alternateCellBorder: Border.all(color: Colors.grey.shade800),
          alternateColumnHeaderBorder: Border.all(color: Colors.grey.shade800),
          alternateRowHeaderBorder: Border.all(color: Colors.grey.shade800),
          columnHeaderBorder: Border.all(color: Colors.grey.shade800),
          cornerBorder: Border.all(color: Colors.grey.shade800),
          rowHeaderBorder: Border.all(color: Colors.grey.shade800),
        ),
      ),
    );
  }
}

