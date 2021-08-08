import 'package:flutter_nba/enums.dart';

class NormalTeam{
  final Map<normalEnums, dynamic> valueMap;

  const NormalTeam({
      required this.valueMap
  });

  factory NormalTeam.fromJson(Map<String, dynamic> json) => NormalTeam(
    valueMap: {
      normalEnums.wins: json['WINS'],
      normalEnums.losses: json['LOSSES'],
      normalEnums.winPct: json['WinPCT'],
      normalEnums.record: json['Record'],
      normalEnums.homeRecord: json['HOME'],
      normalEnums.roadRecord: json['ROAD'],
      normalEnums.lastTen: json['L10'],
      normalEnums.clinchIndicator: json['ClinchIndicator'],
      normalEnums.conferenceGamesBack: json['ConferenceGamesBack'],
      normalEnums.clinchedConferenceTitle: json['ClinchedConferenceTitle'],
      normalEnums.clinchedPlayoffBirth: json['ClinchedPlayoffBirth'],
      normalEnums.clinchedPlayIn: json['ClinchedPlayIn'],
      normalEnums.eliminatedConference: json['EliminatedConference'],
    },

  );
}