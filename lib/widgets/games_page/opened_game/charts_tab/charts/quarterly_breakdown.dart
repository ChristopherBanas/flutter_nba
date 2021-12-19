// Based on: https://github.com/imaNNeoFighT/fl_chart/blob/master/example/lib/line_chart/samples/line_chart_sample1.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/enums.dart';

const colorMap = {
  1610612762: 0xff002B5C, //jazz
  1610612756: 0xff1D1160, //suns
  1610612755: 0xff006BB6, //sixers
  1610612751: 0xff000000, //nets
  1610612743: 0xff0E2240, //nuggets
  1610612746: 0xffC8102E, //clippers
  1610612749: 0xff00471B, //bucks
  1610612742: 0xff00538C, //mavs
  1610612757: 0xffE03A3E, //blazers
  1610612747: 0xff552583, //lakers
  1610612752: 0xff006BB6, //knicks
  1610612737: 0xffE03A3E, //hawks
  1610612748: 0xff98002E, //heat
  1610612744: 0xffFFC72C, //warriors
  1610612763: 0xff5D76A9, //grizzlies
  1610612738: 0xff007A33, //celtics
  1610612764: 0xff002B5C, //wizards
  1610612754: 0xff002D62, //pacers
  1610612766: 0xff1D1160, //hornets
  1610612759: 0xffC4CED4, //spurs
  1610612741: 0xffCE1141, //bulls
  1610612740: 0xff0C2340, //pelicans
  1610612758: 0xff5A2D81, //kings
  1610612761: 0xffCE1141, //raptors
  1610612750: 0xff0C2340, //wolves
  1610612739: 0xff860038, //cavs
  1610612760: 0xff007AC1, //thunder
  1610612753: 0xff0077C0, //magic
  1610612765: 0xffC8102E, //pistons
  1610612745: 0xffCE1141, //rockets
};

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
    minX: 1,
    maxX: 4,
    maxY: 50,
    minY: 0,
  );


  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.white.withOpacity(.8),
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
          case 20:
            return '20';
          case 30:
            return '30';
          case 40:
            return '40';
          case 50:
            return '50';
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
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 22,
    margin: 10,
    interval: 1,
    getTextStyles: (context, value) => const TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
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

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Color(0xff4e4965), width: 4),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarDataHome => LineChartBarData(
    isCurved: true,
    colors: [Color(colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!)],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: [
      FlSpot(1, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q1].valueMap[boxEnums.PTS]),
      FlSpot(2, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q2].valueMap[boxEnums.PTS]),
      FlSpot(3, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q3].valueMap[boxEnums.PTS]),
      FlSpot(4, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.Q4].valueMap[boxEnums.PTS]),
    ],
  );

  LineChartBarData get lineChartBarDataAway => LineChartBarData(
    isCurved: true,
    colors: [Color(colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!)],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x00aa4cfc),
    ]),
    spots: [
      FlSpot(1, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q1].valueMap[boxEnums.PTS]),
      FlSpot(2, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q2].valueMap[boxEnums.PTS]),
      FlSpot(3, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q3].valueMap[boxEnums.PTS]),
      FlSpot(4, globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.Q4].valueMap[boxEnums.PTS]),
    ],
  );
}

class QuarterBreakdownChart extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => QuarterBreakdownChartState();
}

class QuarterBreakdownChartState extends State<QuarterBreakdownChart> {

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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: [
                Color(0xff2c274c),
                Color(0xff46426c),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Quarterly Breakdown',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const ColorRow(),
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

class ColorRow extends StatelessWidget {
  const ColorRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RowChild(teamEnum: gameEnums.AWAY),
          RowChild(teamEnum: gameEnums.HOME),
        ],
      ),
    );
  }
}

class RowChild extends StatelessWidget {
  final gameEnums teamEnum;

  const RowChild({Key? key, required this.teamEnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color(colorMap[globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][teamEnum][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!),
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 7),
          child: Text(
            globals.game.valueMap[gameEnums.TEAM_BOX_SCORE][teamEnum][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION],
            style: TextStyle(
              color: Colors.white,
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

