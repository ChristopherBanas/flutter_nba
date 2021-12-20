// Based on: https://github.com/imaNNeoFighT/fl_chart/blob/master/example/lib/line_chart/samples/line_chart_sample1.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';


class _LineChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LineChart(
      gameBreakdown,
    );
  }

  LineChartData get gameBreakdown => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 4,
    maxY: 160,
    minY: 0,
  );


  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.white,
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: bottomTitles,
    rightTitles: SideTitles(showTitles: false),
    topTitles: SideTitles(showTitles: false),
    leftTitles: leftTitles(
      getTitles: (value) {
        switch (value.toInt()) {
          case 10:
            return '10';
          case 30:
            return '30';
          case 50:
            return '50';
          case 70:
            return '70';
          case 90:
            return '90';
          case 110:
            return '110';
          case 130:
            return '130';
          case 150:
            return '150';
        }
        return '';
      },
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarDataAway,
    lineChartBarDataHome,
  ];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
    getTitles: getTitles,
    showTitles: true,
    margin: 8,
    interval: 1,
    reservedSize: 40,
    getTextStyles: (context, value) => const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    margin: 10,
    interval: 1,
    getTextStyles: (context, value) => const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    getTitles: (value) {
      switch (value.toInt()) {
        case 1:
          return 'Q1';
        case 2:
          return 'Q2';
        case 3:
          return 'Q3';
        case 4:
          return 'Q4';
      }
      return '';
    },
  );

  FlGridData get gridData => FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(width: 2),
      left: BorderSide(width: 2),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarDataHome => LineChartBarData(
    isCurved: true,
    colors: [Color(globals.colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!)],
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: true),
    spots: [
      FlSpot(0, 0),
      FlSpot(1, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q1].valueMap[boxEnums.PTS]),
      FlSpot(2, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.FIRST_HALF].valueMap[boxEnums.PTS]),
      FlSpot(3, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.FIRST_HALF].valueMap[boxEnums.PTS] +
          globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q3].valueMap[boxEnums.PTS]),
      FlSpot(4, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.PTS]),
    ],
  );

  LineChartBarData get lineChartBarDataAway => LineChartBarData(
    isCurved: true,
    colors: [Color(globals.colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!)],
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: FlDotData(show: true),
    spots: [
      FlSpot(0, 0),
      FlSpot(1, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q1].valueMap[boxEnums.PTS]),
      FlSpot(2, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.FIRST_HALF].valueMap[boxEnums.PTS]),
      FlSpot(3, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.FIRST_HALF].valueMap[boxEnums.PTS] +
          globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q3].valueMap[boxEnums.PTS]),
      FlSpot(4, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.PTS]),
    ],
  );
}

class TotalPointsLineChart extends StatefulWidget {
  final Widget colorRow;
  const TotalPointsLineChart({Key? key, required this.colorRow}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TotalPointsLineChartState();
}

class TotalPointsLineChartState extends State<TotalPointsLineChart> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7.5, right: 7.5),
      child: AspectRatio(
        aspectRatio: 1.50,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              color: Theme.of(context).scaffoldBackgroundColor
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 3.5,
                  ),
                  const Text(
                    'Total Points',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  widget.colorRow,
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                      child: _LineChart(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

