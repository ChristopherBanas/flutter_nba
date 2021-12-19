import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/team.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/standings_page/data_cell.dart';
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
  final String date;
  final bool league;

  const StandingsTable({
    required this.teams,
    required this.headers,
    required this.normal,
    required this.date,
    required this.league
  });

  @override
  _StandingsTableState createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {

  @override
  Widget build(BuildContext context) {
    return LazyDataTable(
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
      rows: widget.teams.length,
      columns: widget.headers.length,
      tableDimensions: LazyDataTableDimensions(
        customCellWidth: widget.normal ?
        {0:30, 1:30, 2:50, 3:35, 4:55, 5:55, 6:35, 7:35}
        :
        {0:50, 1:50, 2:125, 3:125, 4:100, 5:100, 6:95, 7:95, 8:80, 9:90, 10:80, 11:60, 12:85, 13:70, 14: 85, 15:110, 16: 95, 17:70, 18:100, 19:100, 20:80, 21:60, 22:55, 23: 50, 24:50, 25:50, 26:55, 27:55, 28:50, 29:50, 30:50, 31:50, 32:50, 33:50, 34:50, 35:50},
        //cellWidth: widget.normal ? 50 : 125,
        cellHeight: 30,
        leftHeaderWidth: 100,
      ),
      topHeaderBuilder: (i) => Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Text(
              widget.headers[i].toString().split('.').last.replaceAll('_', ' '),
              textAlign: TextAlign.right,
            ),
          ),
      ),
      leftHeaderBuilder: (i) => Container(
        color:
          widget.league ?
            null : i > 5 ?
              i < 10 ?
                Colors.yellow.withOpacity(.2) :
                Colors.red.withOpacity(.2)
              : Colors.green.withOpacity(.2),
        child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: Image.asset(
                      'assets/images/${widget.teams[i].valueMap[teamEnums.TEAM_ID]}.png',
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                child: Text('${widget.teams[i].valueMap[teamEnums.NAME]}${scriptMap['${i+1}']}'),
              ),
            ],
        ),
      ),
      dataCellBuilder: (row, col) =>
      widget.normal ?
        CustomDataCell(
          data: widget.teams[row].valueMap[teamEnums.NORMAL_STATS].valueMap.values.toList()[col],
        ) :
        CustomDataCell(
          data: widget.teams[row].valueMap[teamEnums.ADVANCED_STATS].valueMap.values.toList()[col],
        ),
      topLeftCornerWidget: Center(child: Text('${widget.date}'))
    );
  }
}

