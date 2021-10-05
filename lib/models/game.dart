import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/models/player_box_score.dart';
import 'package:flutter_nba/models/team_box_score.dart';

class Game{
  final Map<gameEnums, dynamic> valueMap;

  const Game({
    required this.valueMap
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    valueMap: {
      gameEnums.GAME_ID: json['GAME_ID'],
      gameEnums.TEAM_BOX_SCORE: {
        gameEnums.AWAY: {
          gameEnums.TOTAL: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['TOTAL']),
          gameEnums.FIRST_HALF: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['FIRST_HALF']),
          gameEnums.SECOND_HALF: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['SECOND_HALF']),
          gameEnums.Q1: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['Q1']),
          gameEnums.Q2: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['Q2']),
          gameEnums.Q3: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['Q3']),
          gameEnums.Q4: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['AWAY']['Q4']),
        },
        gameEnums.HOME: {
          gameEnums.TOTAL: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['TOTAL']),
          gameEnums.FIRST_HALF: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['FIRST_HALF']),
          gameEnums.SECOND_HALF: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['SECOND_HALF']),
          gameEnums.Q1: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['Q1']),
          gameEnums.Q2: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['Q2']),
          gameEnums.Q3: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['Q3']),
          gameEnums.Q4: TeamBoxScore.fromJson(json['TEAM_BOX_SCORE']['HOME']['Q4']),
        },
      },
      gameEnums.PLAYER_BOX_SCORE: {
        gameEnums.AWAY: {
          gameEnums.TOTAL: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['TOTAL'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.FIRST_HALF: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['FIRST_HALF'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.SECOND_HALF: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['SECOND_HALF'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q1: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['Q1'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q2: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['Q2'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q3: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['Q3'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q4: [
            for (final player in json['PLAYER_BOX_SCORE']['AWAY']['Q4'])
              PlayerBoxScore.fromJson(player)
          ],
        },
        gameEnums.HOME: {
          gameEnums.TOTAL: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['TOTAL'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.FIRST_HALF: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['FIRST_HALF'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.SECOND_HALF: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['SECOND_HALF'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q1: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['Q1'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q2: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['Q2'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q3: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['Q3'])
              PlayerBoxScore.fromJson(player)
          ],
          gameEnums.Q4: [
            for (final player in json['PLAYER_BOX_SCORE']['HOME']['Q4'])
              PlayerBoxScore.fromJson(player)
          ],
        }
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