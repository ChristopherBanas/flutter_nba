import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/quarter_table.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/sticky_score.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/top_performers/top_performers.dart';
import 'package:flutter_nba/widgets/menu_button/menu_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'box_score/box_score.dart';
import 'card_spacer.dart';
import 'opened_child.dart';

class OpenedPage extends StatefulWidget {
  const OpenedPage({Key? key}) : super(key: key);

  @override
  _OpenedPageState createState() => _OpenedPageState();
}

class _OpenedPageState extends State<OpenedPage> {
  int chosen = 0;

  void setChosen(val) {
    this.setState(() {
      chosen = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_NAME].toString().split(' ').last} - '
              '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_NAME].toString().split(' ').last}'),
          toolbarHeight: 50,
          bottom: OpenedTab(
            callBack: (val) => {setChosen(val)},
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height - 110,
            width: MediaQuery.of(context).size.width - 30,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StickyHeader(
                  header: Column(
                    children: [
                      StickyScore(),
                      CardSpacer(header: true),
                    ],
                  ),
                  content: [
                    Column(
                      children: [
                        OpenedChildFormat(
                          child: QuarterTable(),
                          bottom: false,
                        ),
                        OpenedChildFormat(
                          child: TopPerformersBody(),
                          bottom: true,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        OpenedChildFormat(
                          child: BoxScoreBody(),
                          bottom: true,
                        )
                      ],
                    )
                  ][chosen],
                ),
              ),
            ),
          ),
        ));
  }
}

const tabs = const ['GAME', 'BOX'];

class OpenedTab extends StatefulWidget with PreferredSizeWidget {
  final ValueSetter callBack;

  const OpenedTab({required this.callBack});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _OpenedTabState createState() => _OpenedTabState();
}

class _OpenedTabState extends State<OpenedTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      widget.callBack(_tabController.index);
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
    return TabBar(
      controller: _tabController,
      tabs: [
        for (final tab in tabs)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(tab),
          )
      ],
      indicator: DotIndicator(
        color: Colors.white,
      ),
    );
  }
}
