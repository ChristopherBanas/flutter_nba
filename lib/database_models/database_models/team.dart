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
      teamEnums.teamId: json["TeamID"],
      teamEnums.city: json["TeamCity"],
      teamEnums.name: json["TeamName"],
      teamEnums.conference: json['Conference'],
      teamEnums.playoffRank: json['PlayoffRank'],
      teamEnums.normalStats: NormalTeam.fromJson(json),
      teamEnums.advancedStats: AdvancedTeam.fromJson(json)
    },
  );
}