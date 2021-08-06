class NormalTeam{
  final int wins;
  final int losses;
  final double winPct;
  final String record;
  final String homeRecord;
  final String roadRecord;
  final String lastTen;
  final String clinchIndicator;
  final int conferenceGamesBack;
  final int clinchedConferenceTitle;
  final int clinchedPlayoffBirth;
  final int clinchedPlayIn;
  final int eliminatedConference;

  const NormalTeam({
      required this.wins,
      required this.losses,
      required this.winPct,
      required this.record,
      required this.homeRecord,
      required this.roadRecord,
      required this.lastTen,
      required this.clinchIndicator,
      required this.conferenceGamesBack,
      required this.clinchedConferenceTitle,
      required this.clinchedPlayoffBirth,
      required this.clinchedPlayIn,
      required this.eliminatedConference
  });

  factory NormalTeam.fromJson(Map<String, dynamic> json) => NormalTeam(
    wins: json['WINS'],
    losses: json['LOSSES'],
    winPct: json['WinPCT'],
    record: json['Record'],
    homeRecord: json['HOME'],
    roadRecord: json['ROAD'],
    lastTen: json['L10'],
    clinchIndicator: json['ClinchIndicator'],
    conferenceGamesBack: json['ConferenceGamesBack'],
    clinchedConferenceTitle: json['ClinchedConferenceTitle'],
    clinchedPlayoffBirth: json['ClinchedPlayoffBirth'],
    clinchedPlayIn: json['ClinchedPlayIn'],
    eliminatedConference: json['EliminatedConference'],
  );
}