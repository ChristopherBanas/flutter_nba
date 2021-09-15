import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/top_performers/performer_table.dart';
import 'package:flutter_nba/enums.dart';

class TopPerformersBody extends StatefulWidget {

  @override
  _TopPerformersBodyState createState() => _TopPerformersBodyState();
}

const stats = const ['PTS', 'REB', 'AST'];

class _TopPerformersBodyState extends State<TopPerformersBody> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            for (final stat in stats)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  stat,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              )
          ],
        ),
        [
          PerformerTable(performerEnum: boxEnums.TOP_POINTS, statType: boxEnums.PTS),
          PerformerTable(performerEnum: boxEnums.TOP_REBOUNDS, statType: boxEnums.REB),
          PerformerTable(performerEnum: boxEnums.TOP_ASSISTS, statType: boxEnums.AST),
        ][_tabController.index]
      ],
    );
  }
}

