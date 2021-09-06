import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/widgets/games_page/opened_game/quarter_table.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/sticky_score.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'card_spacer.dart';

class OpenedGameBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      width: MediaQuery.of(context).size.width - 20,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.black,
            width: 1,
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
              content: Column(
                children: [
                  QuarterTable(),
                  CardSpacer(header: false),
                  QuarterTable(),
                  CardSpacer(header: false),
                  QuarterTable(),
                  CardSpacer(header: false),
                  QuarterTable(),
                  CardSpacer(header: false),
                  QuarterTable(),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
