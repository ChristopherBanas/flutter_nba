import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/standings_page/color_identifer.dart';
import 'package:flutter_nba/widgets/stat_switch.dart';
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

class _StandingsBodyState extends State<StandingsBody> with AutomaticKeepAliveClientMixin{
  int selectedStatType = 0;
  bool status = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10,),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)
                ),
                side: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 7, 5, 0),
                      child: StatSwitch(
                          initIndex: selectedStatType,
                          colorList: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.secondary],
                          labels: statTypes,
                          callBack: (index) => {
                            this.setState(() {
                              selectedStatType = index;
                            })
                          }
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                    child: Row(
                      children: [
                        ColorIdentifier(color: Colors.green.withOpacity(.2), text: 'Playoffs'),
                        ColorIdentifier(color: Colors.yellow.withOpacity(.2), text: 'Play in'),
                        ColorIdentifier(color: Colors.red.withOpacity(.2), text: 'Out'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StandingsTable(
                        teams: widget.standingsMap[widget.conference].values.toList(),
                        headers: statTypes[selectedStatType] == 'NORMAL' ?
                        widget.standingsMap[widget.conference].values.toList()[0].valueMap[teamEnums.NORMAL_STATS].valueMap.keys.toList()
                            : widget.standingsMap[widget.conference].values.toList()[0].valueMap[teamEnums.ADVANCED_STATS].valueMap.keys.toList(),
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
