import 'package:flutter_nba/enums.dart';
import 'advanced_team.dart';
import 'normal_team.dart';

class Team{
  final Map<teamEnums, dynamic> valueMap;

  const Team({
    required this.valueMap,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    valueMap: {
      teamEnums.TEAM_ID: json["TeamID"],
      teamEnums.CITY: json["TeamCity"],
      teamEnums.NAME: json["TeamName"],
      teamEnums.CONFERENCE: json['Conference'],
      teamEnums.PLAYOFF_RANK: json['PlayoffRank'],
      teamEnums.NORMAL_STATS: NormalTeam.fromJson(json),
      teamEnums.ADVANCED_STATS: AdvancedTeam.fromJson(json)
    },
  );
}