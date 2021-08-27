import 'package:flutter_nba/enums.dart';

class PlayerBoxScore{
  final Map<boxEnums, dynamic> valueMap;

  const PlayerBoxScore({
    required this.valueMap,
  });

  factory PlayerBoxScore.fromJson(Map<String, dynamic> json) => PlayerBoxScore(
      valueMap: {
        boxEnums.GAME_ID : json['GAME_ID'],
        boxEnums.TEAM_ID : json['TEAM_ID'],
        boxEnums.TEAM_ABBREVIATION : json['TEAM_ABBREVIATION'],
        boxEnums.TEAM_CITY: json['TEAM_CITY'],
        boxEnums.PLAYER_ID: json['PLAYER_ID'],
        boxEnums.PLAYER_NAME: json['PLAYER_NAME'],
        boxEnums.PLAYER_NICKNAME: json['NICKNAME'],
        boxEnums.START_POSITION: json['START_POSITION'],
        boxEnums.MIN : json['MIN'],
        boxEnums.PTS : json['PTS'],
        boxEnums.FGM : json['FGM'],
        boxEnums.FGA : json['FGA'],
        boxEnums.FG_PCT : json['FG_PCT'],
        boxEnums.FG3M : json['FG3M'],
        boxEnums.FG3A : json['FG3A'],
        boxEnums.FG3_PCT : json['FG3_PCT'],
        boxEnums.FTM : json['FTM'],
        boxEnums.FTA : json['FTA'],
        boxEnums.FT_PCT : json['FT_PCT'],
        boxEnums.OREB : json['OREB'],
        boxEnums.DREB : json['DREB'],
        boxEnums.REB : json['REB'],
        boxEnums.AST : json['AST'],
        boxEnums.STL : json['STL'],
        boxEnums.BLK : json['BLK'],
        boxEnums.TO : json['TO'],
        boxEnums.PF : json['PF'],
        boxEnums.PLUS_MINUS : json['PLUS_MINUS'],
      }
  );
}