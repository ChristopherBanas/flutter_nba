import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/database_models/player_box_score.dart';
import 'package:flutter_nba/widgets/database_models/team_box_score.dart';

class Game{
  final Map<gameEnums, dynamic> valueMap;

  const Game({
    required this.valueMap
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
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
      gameEnums.TOP_PERFORMERS: {
        gameEnums.AWAY: {
          boxEnums.TOP_POINTS: [
            for (final player in json['TOP_PERFORMERS']['AWAY']['TOP_POINTS'])
              PlayerBoxScore.fromJson(player)
          ],
          boxEnums.TOP_ASSISTS: [
            for (final player in json['TOP_PERFORMERS']['AWAY']['TOP_ASSISTS'])
              PlayerBoxScore.fromJson(player)
          ],
          boxEnums.TOP_REBOUNDS: [
            for (final player in json['TOP_PERFORMERS']['AWAY']['TOP_REBOUNDS'])
              PlayerBoxScore.fromJson(player)
          ]
        },
        gameEnums.HOME: {
          boxEnums.TOP_POINTS: [
            for (final player in json['TOP_PERFORMERS']['HOME']['TOP_POINTS'])
              PlayerBoxScore.fromJson(player)
          ],
          boxEnums.TOP_ASSISTS: [
            for (final player in json['TOP_PERFORMERS']['HOME']['TOP_ASSISTS'])
              PlayerBoxScore.fromJson(player)
          ],
          boxEnums.TOP_REBOUNDS: [
            for (final player in json['TOP_PERFORMERS']['HOME']['TOP_REBOUNDS'])
              PlayerBoxScore.fromJson(player)
          ]
        }
      },
      gameEnums.DATE: json['DATE'],
    }
  );

}