class AdvancedTeam{
  final String lastTenHome;
  final String lastTenRoad;
  final String overTime;
  final String threePtsOrLess;
  final String tenPtsOrMore;
  final int longestHomeStreak;
  final int longestRoadStreak;
  final int longestWinStreak;
  final int longestLossStreak;
  final int currentHomeStreak;
  final int currentRoadStreak;
  final int currentStreak;
  final String aheadAtHalf;
  final String behindAtHalf;
  final String tiedAtHalf;
  final String aheadAtThird;
  final String behindAtThird;
  final String tiedAtThird;
  final String score100Pts;
  final String oppScore100Pts;
  final String oppOver500;
  final String leadInFgPct;
  final String leadInReb;
  final String fewerTurnovers;
  final double pointsPerGame;
  final double oppPointsPerGame;
  final double diffPointsPerGame;
  final String vsEast;
  final String vsWest;
  final dynamic recordJan;
  final dynamic recordFeb;
  final dynamic recordMar;
  final dynamic recordApr;
  final dynamic recordMay;
  final dynamic recordJun;
  final dynamic recordOct;
  final dynamic recordNov;
  final dynamic recordDec;

  const AdvancedTeam({
        required this.lastTenHome, required this.lastTenRoad, required this.overTime,
        required this.threePtsOrLess, required this.tenPtsOrMore, required this.longestHomeStreak,
        required this.longestRoadStreak, required this.longestWinStreak, required this.longestLossStreak,
        required this.currentHomeStreak, required this.currentRoadStreak, required this.currentStreak,
        required this.aheadAtHalf, required this.behindAtHalf, required this.tiedAtHalf, required this.aheadAtThird,
        required this.behindAtThird, required this.tiedAtThird, required this.score100Pts,
        required this.oppScore100Pts, required this.oppOver500, required this.leadInFgPct, required this.leadInReb,
        required this.fewerTurnovers, required this.pointsPerGame, required this.oppPointsPerGame,
        required this.diffPointsPerGame, required this.vsEast, required this.vsWest, required this.recordJan,
        required this.recordFeb, required this.recordMar, required this.recordApr, required this.recordMay,
        required this.recordJun, required this.recordOct, required this.recordNov, required this.recordDec
  });

  factory AdvancedTeam.fromJson(Map<String, dynamic> json) => AdvancedTeam(
    lastTenHome: json["Last10Home"],
    lastTenRoad: json["Last10Road"],
    overTime: json["OT"],
    threePtsOrLess: json["ThreePTSOrLess"],
    tenPtsOrMore: json["TenPTSOrMore"],
    longestHomeStreak: json["LongHomeStreak"],
    longestRoadStreak: json["LongRoadStreak"],
    longestWinStreak: json["LongWinStreak"],
    longestLossStreak: json["LongLossStreak"],
    currentHomeStreak: json["CurrentHomeStreak"],
    currentRoadStreak: json["CurrentRoadStreak"],
    currentStreak: json["CurrentStreak"],
    aheadAtHalf: json["AheadAtHalf"],
    behindAtHalf: json["BehindAtHalf"],
    tiedAtHalf: json["TiedAtHalf"],
    aheadAtThird: json["AheadAtThird"],
    behindAtThird: json["BehindAtThird"],
    tiedAtThird: json["TiedAtThird"],
    score100Pts: json["Score100PTS"],
    oppScore100Pts: json["OppScore100PTS"],
    oppOver500: json["OppOver500"],
    leadInFgPct: json["LeadInFGPCT"],
    leadInReb: json["LeadInReb"],
    fewerTurnovers: json["FewerTurnovers"],
    pointsPerGame: json["PointsPG"],
    oppPointsPerGame: json["OppPointsPG"],
    diffPointsPerGame: json["DiffPointsPG"],
    vsEast: json["vsEast"],
    vsWest: json["vsWest"],
    recordJan: json["Jan"],
    recordFeb: json["Feb"],
    recordMar: json["Mar"],
    recordApr: json["Apr"],
    recordMay: json["May"],
    recordJun: json["Jun"],
    recordOct: json["Oct"],
    recordNov: json["Nov"],
    recordDec: json["Dec"],
  );

}