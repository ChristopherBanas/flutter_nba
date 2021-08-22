import 'package:flutter_nba/enums.dart';

class NormalTeam{
  final Map<normalEnums, dynamic> valueMap;

  const NormalTeam({
    required this.valueMap
  });

  factory NormalTeam.fromJson(Map<String, dynamic> json) => NormalTeam(
    valueMap: {
      normalEnums.W: json['WINS'],
      normalEnums.L: json['LOSSES'],
      normalEnums.PCT: json['WinPCT'].toStringAsFixed(3),
      normalEnums.GB: json['ConferenceGamesBack'],
      normalEnums.HOME: json['HOME'],
      normalEnums.ROAD: json['ROAD'],
      normalEnums.L10: json['L10'],
      normalEnums.OT: json["OT"],
      // normalEnums.clinchIndicator: json['ClinchIndicator'],
      // normalEnums.clinchedConferenceTitle: json['ClinchedConferenceTitle'],
      // normalEnums.clinchedPlayoffBirth: json['ClinchedPlayoffBirth'],
      // normalEnums.clinchedPlayIn: json['ClinchedPlayIn'],
      // normalEnums.eliminatedConference: json['EliminatedConference'],
    },

  );
}