// Based on: https://github.com/imaNNeoFighT/fl_chart/blob/master/example/lib/bar_chart/samples/bar_chart_sample2.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';

import 'chart_template.dart';

class QuarterlyBarChart extends StatefulWidget {
  final Widget colorRow;
  const QuarterlyBarChart({Key? key, required this.colorRow}) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuarterlyBarChartState();
}

class QuarterlyBarChartState extends State<QuarterlyBarChart> {
  final Color awayBarColor = globals.awayColor;
  final Color homeBarColor = globals.homeColor;
  final double width = 7.0;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(
        1,
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q1]
            .valueMap[boxEnums.PTS],
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q1]
            .valueMap[boxEnums.PTS]);
    final barGroup2 = makeGroupData(
        2,
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q2]
            .valueMap[boxEnums.PTS],
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q2]
            .valueMap[boxEnums.PTS]);
    final barGroup3 = makeGroupData(
        3,
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q3]
            .valueMap[boxEnums.PTS],
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q3]
            .valueMap[boxEnums.PTS]);
    final barGroup4 = makeGroupData(
        4,
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q4]
            .valueMap[boxEnums.PTS],
        globals
            .game
            .valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q4]
            .valueMap[boxEnums.PTS]);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  BarTouchData get lineTouchData1 => BarTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.white,
    ),
  );

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [awayBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [homeBarColor],
        width: width,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ChartTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            height: 3.5,
          ),
          const Center(
            child: const Text(
              'Points Per Quarter',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          widget.colorRow,
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 60,
                barTouchData: lineTouchData1,
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    margin: 10,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 1:
                          return 'Q1';
                        case 2:
                          return 'Q2';
                        case 3:
                          return 'Q3';
                        case 4:
                          return 'Q4';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    margin: 8,
                    reservedSize: 28,
                    interval: 1,
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 15:
                          return '15';
                        case 30:
                          return '30';
                        case 45:
                          return '45';
                        case 60:
                          return '60';
                        default:
                          return '';
                      }
                    },
                  ),
                ),
                borderData: FlBorderData(
                  border: const Border(
                    bottom: BorderSide(width: 2),
                    left: BorderSide(width: 2),
                    right: BorderSide(color: Colors.transparent),
                    top: BorderSide(color: Colors.transparent),
                  ),
                ),
                barGroups: showingBarGroups,
                gridData: FlGridData(show: true),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
