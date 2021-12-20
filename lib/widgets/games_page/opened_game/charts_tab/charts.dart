import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/card_spacer.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/chart_legend.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/quarterly_breakdown.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/total_points.dart';

class ChartsBody extends StatefulWidget {
  const ChartsBody({Key? key}) : super(key: key);

  @override
  _ChartsBodyState createState() => _ChartsBodyState();
}

class _ChartsBodyState extends State<ChartsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartTemplate(child: QuarterlyBarChart(colorRow: ColorRow())),
        ChartTemplate(child: TotalPointsLineChart(colorRow: ColorRow())),
      ],
    );
  }
}

class ChartTemplate extends StatelessWidget {
  final Widget child;

  const ChartTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: child,
    );
  }
}

