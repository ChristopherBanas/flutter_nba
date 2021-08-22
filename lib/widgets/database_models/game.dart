import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/database_models/player_box_score.dart';
import 'package:flutter_nba/widgets/database_models/team_box_score.dart';

class GameModel{
  final Map<gameEnums, dynamic> valueMap;

  const GameModel({
    required this.valueMap
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    valueMap: {
      gameEnums.GAME_ID: json['GAME_ID'],
      gameEnums.TEAM_BOX_SCORE: {
        gameEnums.AWAY: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']),
        gameEnums.HOME: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME'])
      },
      gameEnums.PLAYER_BOX_SCORE: {
        gameEnums.AWAY: [
          for (final player in json['PLAYER_BOX_SCORE']['AWAY'])
            PlayerBoxScore.fromJson(player)
        ],
        gameEnums.HOME: [
          for (final player in json['PLAYER_BOX_SCORE']['HOME'])
            PlayerBoxScore.fromJson(player)
        ],
      },
      // gameEnums.TOP_PERFORMERS: json['TOP_PERFORMERS'],
      // gameEnums.DATE: json['DATE'],
    }
  );

}