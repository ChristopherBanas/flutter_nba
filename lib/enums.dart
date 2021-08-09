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
  W,
  L,
  PCT,
  HOME,
  ROAD,
  L10,
  clinchIndicator,
  GB,
  OT,
  clinchedConferenceTitle,
  clinchedPlayoffBirth,
  clinchedPlayIn,
  eliminatedConference,
}

enum advancedEnums {
  L10_HOME, L10_ROAD,
  THREE_PT_GAMES, TEN_PT_GAMES, LONGEST_HOME_STREAK,
  LONGEST_ROAD_STREAK, LONGEST_W_STREAK, LONGEST_L_STREAK,
  CUR_HOME_STREAK, CUR_ROAD_STREAK, CUR_STREAK,
  UP_AT_HALF, DOWN_AT_HALF, TIED_AT_HALF, UP_AFTER_THIRD,
  DOWN_AFTER_THIRD, TIED_AFTER_THIRD, SCORE_100,
  OPP_SCORE_100, VS_500_AND_ABOVE, LEAD_FG_PCT, LEAD_REB,
  LESS_TO, PPG, OPP_PPG,
  DIFF_PPG, VS_EAST, VS_WEST, JAN,
  FEB, MAR, APR, MAY,
  JUN, OCT, NOV, DEC
}