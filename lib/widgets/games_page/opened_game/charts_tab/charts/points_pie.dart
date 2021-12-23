import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'chart_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';

class PointsPieChart extends StatefulWidget {
  const PointsPieChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PointsPieChartState();
}


class PointsPieChartState extends State<PointsPieChart> with SingleTickerProviderStateMixin {
  int touchedIndex = -1;

  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var away = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q4]
        .valueMap[boxEnums.TEAM_ABBREVIATION];
    var home = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q4]
        .valueMap[boxEnums.TEAM_ABBREVIATION];
    List<String> tabs = [away, home];
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: TabBar(
            controller: _tabController,
            indicatorColor: [
              Color(globals.colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!),
              Color(globals.colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!)
            ][_tabController.index],
            tabs: [
              for (final tab in tabs)
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                )
            ],
          ),
        ),
        ChartTemplate(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    height: 3.5,
                  ),
                  const Center(
                    child: const Text(
                      'Points Breakdown',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  PieRow(),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: [
                          showingSections(gameEnums.AWAY),
                          showingSections(gameEnums.HOME),
                        ][_tabController.index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(gameEnums location) {
    var total = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][location][gameEnums.TOTAL]
        .valueMap[boxEnums.PTS];
    var q1 = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][location][gameEnums.Q1]
        .valueMap[boxEnums.PTS];
    var q2 = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][location][gameEnums.Q2]
        .valueMap[boxEnums.PTS];
    var q3 = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][location][gameEnums.Q3]
        .valueMap[boxEnums.PTS];
    var q4 = globals
        .game
        .valueMap[gameEnums.TEAM_BOX_SCORE][location][gameEnums.Q4]
        .valueMap[boxEnums.PTS];
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 90.0 : 80.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: q1,
            title: '${((q1 / total) * 100).round()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: q2,
            title: '${((q2 / total) * 100).round()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: q3,
            title: '${((q3 / total) * 100).round()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: q4,
            title: '${((q4 / total) * 100).round()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

class PieRow extends StatelessWidget {
  const PieRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PieChild(color: const Color(0xff0293ee), last: false, label: "Q1"),
            PieChild(color: const Color(0xfff8b250), last: false, label: "Q2"),
            PieChild(color: const Color(0xff845bef), last: false, label: "Q3"),
            PieChild(color: const Color(0xff13d38e), last: true, label: "Q4"),
          ],
        ),
      ),
    );
  }
}

class PieChild extends StatelessWidget {
  final Color color;
  final bool last;
  final String label;

  const PieChild({Key? key, required this.color, required this.last, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: Theme.of(context).textTheme.bodyText1!.color!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        Container(
          margin: last  ? const EdgeInsets.only(left: 5, right: 0)
              : const EdgeInsets.only(left: 5, right: 7),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}