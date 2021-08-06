import 'package:flutter_nba/database_models/teams/advanced_team.dart';
import 'package:flutter_nba/database_models/teams/normal_team.dart';

class Team{
  final int teamId;
  final String city;
  final String name;
  final String conference;
  final int playoffRank;
  final NormalTeam normalStats;
  final AdvancedTeam advancedStats;

  const Team({
    required this.teamId,
    required this.city,
    required this.name,
    required this.conference,
    required this.playoffRank,
    required this.normalStats,
    required this.advancedStats
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamId: json["TeamID"],
    city: json["TeamCity"],
    name: json["TeamName"],
    conference: json['Conference'],
    playoffRank: json['PlayoffRank'],
    normalStats: NormalTeam.fromJson(json),
    advancedStats: AdvancedTeam.fromJson(json)
  );
}