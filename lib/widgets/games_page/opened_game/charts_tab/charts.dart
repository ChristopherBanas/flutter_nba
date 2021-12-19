import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/quarterly_breakdown.dart';

class ChartsBody extends StatefulWidget {
  const ChartsBody({Key? key}) : super(key: key);

  @override
  _ChartsBodyState createState() => _ChartsBodyState();
}

class _ChartsBodyState extends State<ChartsBody> {
  @override
  Widget build(BuildContext context) {
    return QuarterBreakdownChart();
  }
}
