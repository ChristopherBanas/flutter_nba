import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10,),
      child: Column(
        children: [
          Wrap(
            children: [
              for (var i = 0; i < statTypes.length; i++)
                ChoiceChip(
                  label: Text(statTypes[i]),
                  selected: selectedStatType == i,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedStatType = i;
                    });
                  },
                )
            ],
          ),
          Expanded(
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
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
            ),
          ),
        ],
      ),
    );
  }
}
