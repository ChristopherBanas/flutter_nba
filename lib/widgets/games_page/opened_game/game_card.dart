import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/widgets/games_page/opened_game/body.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class GameCard extends StatefulWidget {
  final bool hidden;
  final ValueSetter updateHidden;

  const GameCard({
    required this.hidden,
    required this.updateHidden
  });

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  int chosen = 0;

  @override
  void initState(){
    super.initState();
    this.chosen = 0;
  }

  void setChosen(val){
    this.setState(() {
      chosen = val;
    });
  }

  void hideCard(){
    chosen = 0;
    widget.updateHidden(true);
  }

  @override
  Widget build(BuildContext context) {
    return widget.hidden ? Container() :
    Dismissible(
      direction: DismissDirection.vertical,
      key: const Key('key'),
      onDismissed: (_) => hideCard(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              TopRow(),
              MiddleRow(callBack: (val) => {setChosen(val)},),
              OpenedGameBody(selected: chosen),
            ],
          ),
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Container(
      height: 50,
      width: 200,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}',
                style: TextStyle(
                  //fontSize: height / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]}',
                style: TextStyle(
                  //fontSize: height / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const tabs = const ['GAME', 'BOX'];

class MiddleRow extends StatefulWidget {
  final ValueSetter callBack;

  const MiddleRow({
    required this.callBack
  });

  @override
  _MiddleRowState createState() => _MiddleRowState();
}

class _MiddleRowState extends State<MiddleRow> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 7.5),
      child: Container(
        height: 35,
        width: 300,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TabBar(
                controller: _tabController,
                tabs: [
                  for (final tab in tabs)
                    Text(
                        tab,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color
                        ),
                    )
                ],
                indicator: MaterialIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                    horizontalPadding: 10,
                    strokeWidth: .5,
                    height: 2
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
