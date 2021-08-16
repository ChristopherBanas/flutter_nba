import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/standings_page/stat_switch.dart';
import 'data_table.dart';

class StandingsBody extends StatefulWidget {
  final Map<String, dynamic> standingsMap;
  final String conference;

  const StandingsBody({
      required this.standingsMap,
      required this.conference
  });

  @override
  _StandingsBodyState createState() => _StandingsBodyState();
}

const statTypes = const ['NORMAL', 'ADVANCED'];

class _StandingsBodyState extends State<StandingsBody> {
  int selectedStatType = 0;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10,),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 7, 5, 0),
                    child: Row(
                      children: [
                        StatSwitch(
                            initIndex: selectedStatType,
                            callBack: (index) => {
                              this.setState(() {
                                selectedStatType = index;
                              })
                            }
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StandingsTable(
                        teams: widget.standingsMap[widget.conference].values.toList(),
                        headers: statTypes[selectedStatType] == 'NORMAL' ?
                        widget.standingsMap[widget.conference].values.toList()[0].valueMap[teamEnums.normalStats].valueMap.keys.toList()
                            : widget.standingsMap[widget.conference].values.toList()[0].valueMap[teamEnums.advancedStats].valueMap.keys.toList(),
                        normal: statTypes[selectedStatType] == 'NORMAL' ? true : false,
                        league: widget.conference == 'LEAGUE' ? true : false,
                        date: widget.standingsMap['DATE']
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
