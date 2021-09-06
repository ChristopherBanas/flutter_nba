enum teamEnums {
  TEAM_ID,
  CITY,
  NAME,
  CONFERENCE,
  PLAYOFF_RANK,
  NORMAL_STATS,
  ADVANCED_STATS
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

enum gameEnums{
  GAME_ID,
  TEAM_BOX_SCORE,
  AWAY,
  HOME,
  PLAYER_BOX_SCORE,
  TOP_PERFORMERS,
  DATE,
  TOTAL,
  FIRST_HALF,
  SECOND_HALF,
  Q1,Q2,Q3,Q4
}

enum boxEnums{
  SEASON_ID,TEAM_ID,TEAM_ABBREVIATION,
  TEAM_NAME,GAME_ID,GAME_DATE,MATCHUP,WL,MIN,
  PTS,FGM,FGA,FG_PCT,FG3M,FG3A,FG3_PCT,FTM,FTA,
  FT_PCT,OREB,DREB,REB,AST,STL,BLK,TOV,PF,PLUS_MINUS,
  PLAYER_ID,PLAYER_NAME,PLAYER_NICKNAME,START_POSITION,
  TEAM_CITY, TO, TOP_POINTS, TOP_ASSISTS, TOP_REBOUNDS
}