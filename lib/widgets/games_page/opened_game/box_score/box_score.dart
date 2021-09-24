import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';
import 'package:flutter_nba/enums.dart';
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
                    labels: ['TEAM', 'PLAYER'],
                    callBack: (index) => {
                      this.setState(() {
                        selectedBoxType = index;
                      })
                    }
                ),
                selectedBoxType == 0 ? Container() :
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: StatSwitch(
                      initIndex: selectedTeamType,
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
            ),
          ),
          TeamBoxBody(statDuration: sliderMap[sliderValue.toInt()]!,),
        ],
      ),
    );
  }
}
