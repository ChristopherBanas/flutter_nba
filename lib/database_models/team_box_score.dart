import 'package:flutter_nba/enums.dart';

class TeamBoxScore{
  final Map<boxEnums, dynamic> valueMap;

  const TeamBoxScore({
    required this.valueMap,
  });

  factory TeamBoxScore.fromJson(Map<String, dynamic> json) => TeamBoxScore(
    valueMap: {
      boxEnums.SEASON_ID : json['SEASON_ID'],
      boxEnums.TEAM_ID : json['TEAM_ID'],
      boxEnums.TEAM_ABBREVIATION : json['TEAM_ABBREVIATION'],
      boxEnums.TEAM_NAME: json['TEAM_NAME'],
      boxEnums.GAME_ID : json['GAME_ID'],
      boxEnums.GAME_DATE : json['GAME_DATE'],
      boxEnums.MATCHUP : json['MATCHUP'],
      boxEnums.WL : json['WL'],
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
      boxEnums.TOV : json['TO'],
      boxEnums.PF : json['PF'],
      boxEnums.PLUS_MINUS : json['PLUS_MINUS'],
    }
  );
}