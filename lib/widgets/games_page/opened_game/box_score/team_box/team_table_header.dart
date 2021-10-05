import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/globals.dart' as globals;
import 'package:flutter_nba/enums.dart';

class TeamTableHeader extends StatelessWidget {
  final bool first;

  const TeamTableHeader({
    required this.first
  });

  Image getImage(id){
    return Image.asset(
      'assets/images/$id.png',
      height: 60,
      width: 60,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    gameEnums homeAway = first ? gameEnums.AWAY : gameEnums.HOME;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        first ? getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][homeAway][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID])
            : Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(game.valueMap[gameEnums.TEAM_BOX_SCORE][homeAway][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION])
            ),
        first ? Container(
            margin: const EdgeInsets.only(right: 10),
            child: Text(game.valueMap[gameEnums.TEAM_BOX_SCORE][homeAway][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION])
        )   : getImage(game.valueMap[gameEnums.TEAM_BOX_SCORE][homeAway][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID])
      ],
    );
  }
}
