import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/player_box/player_box_body.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/box_score/team_box/team_box_body.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../stat_switch.dart';
import 'package:flutter_nba/globals.dart' as globals;

class BoxScoreBody extends StatefulWidget {
  const BoxScoreBody({Key? key}) : super(key: key);

  @override
  _BoxScoreBodyState createState() => _BoxScoreBodyState();
}

const sliderMap = {0: gameEnums.Q1, 20: gameEnums.Q2, 40: gameEnums.FIRST_HALF,
  60: gameEnums.Q3, 80: gameEnums.Q4, 100: gameEnums.SECOND_HALF, 120: gameEnums.TOTAL};
const teamMap = {0: gameEnums.AWAY, 1: gameEnums.HOME};

class _BoxScoreBodyState extends State<BoxScoreBody> {
  int selectedBoxType = 0;
  int selectedTeamType = 0;
  double sliderValue = 120.0;

  String _handleLabelCreated(dynamic val, String str) {
    if (str == '0') {
      str = 'Q1';
    } else if (str == '20') {
      str = 'Q2';
    } else if (str == '40') {
      str = 'H1 ';
    } else if (str == '60') {
      str = 'Q3 ';
    } else if (str == '80') {
      str = 'Q4 ';
    } else if (str == '100') {
      str = 'H2 ';
    } else if (str == '120') {
      str = 'T';
    }
    return str;
  }

  sliderChanged(dynamic val){
    this.setState(() {
      sliderValue = val;
    });
  }

  boxScoreChange(int index){
    this.setState(() {
      selectedBoxType = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Game game = globals.game;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                StatSwitch(
                    initIndex: selectedBoxType,
                    colorList: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.secondary],
                    labels: ['TEAM', 'PLAYER'],
                    callBack: (index) => {
                      this.setState(() {
                        selectedBoxType = index;
                      })
                    }
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: SfSlider(
                min: 0,
                stepSize: 20,
                max: 120,
                interval: 20,
                value: sliderValue,
                enableTooltip: true,
                tooltipShape: SfRectangularTooltipShape(),
                tooltipTextFormatterCallback: _handleLabelCreated,
                labelFormatterCallback: _handleLabelCreated,
                showTicks: true,
                showLabels: true,
                onChanged: (dynamic val) => sliderChanged(val),
                activeColor: selectedBoxType == 0 ? Theme.of(context).sliderTheme.activeTrackColor
                    : Color(globals.primaryColors[selectedTeamType == 0 ?
                game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID] :
                game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!),
                inactiveColor: selectedBoxType == 0 ? Theme.of(context).sliderTheme.inactiveTrackColor
                    : Color(globals.primaryColors[selectedTeamType == 0 ?
                game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID] :
                game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!).withOpacity(.6),
            ),
          ),
          selectedBoxType == 0 ? TeamBoxBody(statDuration: sliderMap[sliderValue.toInt()]!,)
              : Column(
                children: [
                  PlayerBoxBody(statDuration: sliderMap[sliderValue.toInt()]!, team: teamMap[selectedTeamType]!),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: StatSwitch(
                        initIndex: selectedTeamType,
                        colorList: [Color(globals.primaryColors[game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!),
                          Color(globals.primaryColors[game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!)],
                        labels: [
                          game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION],
                          game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ABBREVIATION]
                        ],
                        callBack: (index) => {
                          this.setState(() {
                            selectedTeamType = index;
                          })
                        }
                    ),
                  ),
                ],
              )
        ],
      ),
    );
  }
}
