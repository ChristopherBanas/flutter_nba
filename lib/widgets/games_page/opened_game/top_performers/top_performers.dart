import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';

class TopPerformersBody extends StatefulWidget {

  @override
  _TopPerformersBodyState createState() => _TopPerformersBodyState();
}

const stats = const ['PTS', 'REB', 'AST'];

class _TopPerformersBodyState extends State<TopPerformersBody> with SingleTickerProviderStateMixin {
  int selectedConference = 0;
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
                child: Text(stat),
              )
          ],
          indicator: PointTabIndicator(
              position: PointTabIndicatorPosition.bottom,
              color: Colors.white,
              insets: EdgeInsets.only(bottom: 6)
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
        ),
      ],
    );
  }
}

