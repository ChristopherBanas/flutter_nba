import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/top_performers/performer_cell.dart';

class PerformerTable extends StatefulWidget {
  final boxEnums performerEnum;
  final boxEnums statType;

  const PerformerTable({
    required this.performerEnum,
    required this.statType
  });

  @override
  _PerformerTableState createState() => _PerformerTableState();
}

class _PerformerTableState extends State<PerformerTable> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Table(
          border: TableBorder(
            verticalInside: BorderSide(width:  1, color: Colors.grey),
            horizontalInside: BorderSide(width:  1, color: Colors.grey),
          ),
          children: [
            TableRow(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: PerformerCell(performerEnum: widget.performerEnum, statType: widget.statType, first: true, homeAway: gameEnums.AWAY, index: 0)
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: PerformerCell(performerEnum: widget.performerEnum, statType: widget.statType, first: false, homeAway: gameEnums.HOME, index: 0)
                )
              ]
            ),
            TableRow(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: PerformerCell(performerEnum: widget.performerEnum, statType: widget.statType, first: true, homeAway: gameEnums.AWAY, index: 1)
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: PerformerCell(performerEnum: widget.performerEnum, statType: widget.statType, first: false, homeAway: gameEnums.HOME, index: 1)
                  )
                ]
            ),
            TableRow(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: PerformerCell(performerEnum: widget.performerEnum, statType: widget.statType, first: true, homeAway: gameEnums.AWAY, index: 2)
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: PerformerCell(performerEnum: widget.performerEnum, statType: widget.statType, first: false, homeAway: gameEnums.HOME, index: 2)
                  )
                ]
            ),
          ],
        ),
        // child: DataTable(
        //   columnSpacing: 40,
        //   showCheckboxColumn: false,
        //   columns: const<DataColumn> [
        //     DataColumn(
        //       label: Text(""),
        //     ),
        //     DataColumn(
        //       label: Text(""),
        //     ),
        //   ],
        //   rows: [
        //     DataRow(
        //         cells: [
        //           DataCell(
        //             PerformerCell(
        //                 performerEnum: performerEnum,
        //                 statType: statType,
        //                 first: true,
        //                 homeAway: gameEnums.AWAY,
        //                 index: 0,
        //             )
        //           ),
        //           DataCell(
        //               PerformerCell(
        //                   performerEnum: performerEnum,
        //                   statType: statType,
        //                   first: false,
        //                   homeAway: gameEnums.HOME,
        //                   index: 0,
        //               )
        //           ),
        //         ]
        //     ),
        //     DataRow(
        //         cells: [
        //           DataCell(
        //               PerformerCell(
        //                 performerEnum: performerEnum,
        //                 statType: statType,
        //                 first: true,
        //                 homeAway: gameEnums.AWAY,
        //                 index: 1,
        //               )
        //           ),
        //           DataCell(
        //               PerformerCell(
        //                 performerEnum: performerEnum,
        //                 statType: statType,
        //                 first: false,
        //                 homeAway: gameEnums.HOME,
        //                 index: 1,
        //               )
        //           ),
        //         ]
        //     ),
        //     DataRow(
        //         cells: [
        //           DataCell(
        //               PerformerCell(
        //                 performerEnum: performerEnum,
        //                 statType: statType,
        //                 first: true,
        //                 homeAway: gameEnums.AWAY,
        //                 index: 2,
        //               )
        //           ),
        //           DataCell(
        //               PerformerCell(
        //                 performerEnum: performerEnum,
        //                 statType: statType,
        //                 first: false,
        //                 homeAway: gameEnums.HOME,
        //                 index: 2,
        //               )
        //           ),
        //         ]
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
