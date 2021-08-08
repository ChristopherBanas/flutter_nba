import 'package:flutter_nba/enums.dart';

class AdvancedTeam{
  final Map<advancedEnums, dynamic> valueMap;

  const AdvancedTeam({
        required this.valueMap
  });

  factory AdvancedTeam.fromJson(Map<String, dynamic> json) => AdvancedTeam(
    valueMap: {
      advancedEnums.lastTenHome: json["Last10Home"],
      advancedEnums.lastTenRoad: json["Last10Road"],
      advancedEnums.overTime: json["OT"],
      advancedEnums.threePtsOrLess: json["ThreePTSOrLess"],
      advancedEnums.tenPtsOrMore: json["TenPTSOrMore"],
      advancedEnums.longestHomeStreak: json["LongHomeStreak"],
      advancedEnums.longestRoadStreak: json["LongRoadStreak"],
      advancedEnums.longestWinStreak: json["LongWinStreak"],
      advancedEnums.longestLossStreak: json["LongLossStreak"],
      advancedEnums.currentHomeStreak: json["CurrentHomeStreak"],
      advancedEnums.currentRoadStreak: json["CurrentRoadStreak"],
      advancedEnums.currentStreak: json["CurrentStreak"],
      advancedEnums.aheadAtHalf: json["AheadAtHalf"],
      advancedEnums.behindAtHalf: json["BehindAtHalf"],
      advancedEnums.tiedAtHalf: json["TiedAtHalf"],
      advancedEnums.aheadAtThird: json["AheadAtThird"],
      advancedEnums.behindAtThird: json["BehindAtThird"],
      advancedEnums.tiedAtThird: json["TiedAtThird"],
      advancedEnums.score100Pts: json["Score100PTS"],
      advancedEnums.oppScore100Pts: json["OppScore100PTS"],
      advancedEnums.oppOver500: json["OppOver500"],
      advancedEnums.leadInFgPct: json["LeadInFGPCT"],
      advancedEnums.leadInReb: json["LeadInReb"],
      advancedEnums.fewerTurnovers: json["FewerTurnovers"],
      advancedEnums.pointsPerGame: json["PointsPG"],
      advancedEnums.oppPointsPerGame: json["OppPointsPG"],
      advancedEnums.diffPointsPerGame: json["DiffPointsPG"],
      advancedEnums.vsEast: json["vsEast"],
      advancedEnums.vsWest: json["vsWest"],
      advancedEnums.recordJan: json["Jan"],
      advancedEnums.recordFeb: json["Feb"],
      advancedEnums.recordMar: json["Mar"],
      advancedEnums.recordApr: json["Apr"],
      advancedEnums.recordMay: json["May"],
      advancedEnums.recordJun: json["Jun"],
      advancedEnums.recordOct: json["Oct"],
      advancedEnums.recordNov: json["Nov"],
      advancedEnums.recordDec: json["Dec"],
    },

  );

}