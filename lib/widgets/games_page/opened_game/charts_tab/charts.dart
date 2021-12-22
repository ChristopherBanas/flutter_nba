import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/card_spacer.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/chart_legend.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/quarterly_breakdown.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/charts_tab/charts/total_points.dart';

class ChartsBody extends StatefulWidget {
  const ChartsBody({Key? key}) : super(key: key);

  @override
  _ChartsBodyState createState() => _ChartsBodyState();
}

const tabs = const ['PTS-Q', 'PTS-T'];

class _ChartsBodyState extends State<ChartsBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
    // return Column(
    //   children: [
    //     ChartTemplate(child: QuarterlyBarChart(colorRow: ColorRow())),
    //     ChartTemplate(child: TotalPointsLineChart(colorRow: ColorRow())),
    //   ],
    // );
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: TabBar(
            controller: _tabController,
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
        [
          ChartTemplate(child: QuarterlyBarChart(colorRow: ColorRow())),
          ChartTemplate(child: TotalPointsLineChart(colorRow: ColorRow())),
        ][_tabController.index]
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

