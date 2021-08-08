enum teamEnums {
  teamId,
  city,
  name,
  conference,
  playoffRank,
  normalStats,
  advancedStats
}

enum normalEnums {
  wins,
  losses,
  winPct,
  record,
  homeRecord,
  roadRecord,
  lastTen,
  clinchIndicator,
  conferenceGamesBack,
  clinchedConferenceTitle,
  clinchedPlayoffBirth,
  clinchedPlayIn,
  eliminatedConference,
}

enum advancedEnums {
  lastTenHome, lastTenRoad, overTime,
  threePtsOrLess, tenPtsOrMore, longestHomeStreak,
  longestRoadStreak, longestWinStreak, longestLossStreak,
  currentHomeStreak, currentRoadStreak, currentStreak,
  aheadAtHalf, behindAtHalf, tiedAtHalf, aheadAtThird,
  behindAtThird, tiedAtThird, score100Pts,
  oppScore100Pts, oppOver500, leadInFgPct, leadInReb,
  fewerTurnovers, pointsPerGame, oppPointsPerGame,
  diffPointsPerGame, vsEast, vsWest, recordJan,
  recordFeb, recordMar, recordApr, recordMay,
  recordJun, recordOct, recordNov, recordDec
}