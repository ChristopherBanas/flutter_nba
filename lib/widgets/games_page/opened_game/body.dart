import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/box_score.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/opened_child.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/quarter_table.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/sticky_score.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/top_performers/top_performers.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'card_spacer.dart';

class OpenedGameBody extends StatefulWidget {
  final int selected;

  const OpenedGameBody({
    required this.selected
  });

  @override
  _OpenedGameBodyState createState() => _OpenedGameBodyState();
}

class _OpenedGameBodyState extends State<OpenedGameBody> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
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
                    OpenedChildFormat(child: QuarterTable(), bottom: false,),
                    OpenedChildFormat(child: TopPerformersBody(), bottom: true,),
                  ],
                ),
                Column(
                  children: [
                    OpenedChildFormat(child: BoxScoreBody(), bottom: true,)
                  ],
                )
              ][widget.selected],
            ),
          ),
        ),
      ),
    );
  }
}
