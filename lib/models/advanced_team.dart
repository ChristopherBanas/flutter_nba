import 'package:flutter_nba/enums.dart';

class AdvancedTeam{
  final Map<advancedEnums, dynamic> valueMap;

  const AdvancedTeam({
    required this.valueMap
  });

  factory AdvancedTeam.fromJson(Map<String, dynamic> json) => AdvancedTeam(
    valueMap: {
      advancedEnums.L10_HOME: json["Last10Home"],
      advancedEnums.L10_ROAD: json["Last10Road"],
      advancedEnums.LONGEST_HOME_STREAK: json["strLongHomeStreak"],
      advancedEnums.LONGEST_ROAD_STREAK: json["strLongRoadStreak"],
      advancedEnums.LONGEST_W_STREAK: json["LongWinStreak"],
      advancedEnums.LONGEST_L_STREAK: json["LongLossStreak"],
      advancedEnums.CUR_HOME_STREAK: json["strCurrentHomeStreak"],
      advancedEnums.CUR_ROAD_STREAK: json["strCurrentRoadStreak"],
      advancedEnums.CUR_STREAK: json["strCurrentStreak"],
      advancedEnums.THREE_PT_GAMES: json["ThreePTSOrLess"],
      advancedEnums.TEN_PT_GAMES: json["TenPTSOrMore"],
      advancedEnums.UP_AT_HALF: json["AheadAtHalf"],
      advancedEnums.DOWN_AT_HALF: json["BehindAtHalf"],
      advancedEnums.TIED_AT_HALF: json["TiedAtHalf"],
      advancedEnums.UP_AFTER_THIRD: json["AheadAtThird"],
      advancedEnums.DOWN_AFTER_THIRD: json["BehindAtThird"],
      advancedEnums.TIED_AFTER_THIRD: json["TiedAtThird"],
      advancedEnums.SCORE_100: json["Score100PTS"],
      advancedEnums.OPP_SCORE_100: json["OppScore100PTS"],
      advancedEnums.VS_500_AND_ABOVE: json["OppOver500"],
      advancedEnums.LEAD_FG_PCT: json["LeadInFGPCT"],
      advancedEnums.LEAD_REB: json["LeadInReb"],
      advancedEnums.LESS_TO: json["FewerTurnovers"],
      advancedEnums.PPG: json["PointsPG"],
      advancedEnums.OPP_PPG: json["OppPointsPG"],
      advancedEnums.DIFF_PPG: json["DiffPointsPG"],
      advancedEnums.VS_EAST: json["vsEast"],
      advancedEnums.VS_WEST: json["vsWest"],
      advancedEnums.OCT: json["Oct"] == null ? 'N/A' : json["Oct"],
      advancedEnums.NOV: json["Nov"] == null ? 'N/A' : json["Nov"],
      advancedEnums.DEC: json["Dec"] == null ? 'N/A' : json["Dec"],
      advancedEnums.JAN: json["Jan"] == null ? 'N/A' : json["Jan"],
      advancedEnums.FEB: json["Feb"] == null ? 'N/A' : json["Feb"],
      advancedEnums.MAR: json["Mar"] == null ? 'N/A' : json["Mar"],
      advancedEnums.APR: json["Apr"] == null ? 'N/A' : json["Apr"],
      advancedEnums.MAY: json["May"] == null ? 'N/A' : json["May"],
    }
  );
}
