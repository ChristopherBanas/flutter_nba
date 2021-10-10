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
const colorMap = {
  1610612762: 0xff002B5C, //jazz
  1610612756: 0xff1D1160, //suns
  1610612755: 0xff006BB6, //sixers
  1610612751: 0xff000000, //nets
  1610612743: 0xff0E2240, //nuggets
  1610612746: 0xffC8102E, //clippers
  1610612749: 0xff00471B, //bucks
  1610612742: 0xff00538C, //mavs
  1610612757: 0xffE03A3E, //blazers
  1610612747: 0xff552583, //lakers
  1610612752: 0xff006BB6, //knicks
  1610612737: 0xffE03A3E, //hawks
  1610612748: 0xff98002E, //heat
  1610612744: 0xff1D428A, //warriors
  1610612763: 0xff5D76A9, //grizzlies
  1610612738: 0xff007A33, //celtics
  1610612764: 0xff002B5C, //wizards
  1610612754: 0xff002D62, //pacers
  1610612766: 0xff1D1160, //hornets
  1610612759: 0xffC4CED4, //spurs
  1610612741: 0xffCE1141, //bulls
  1610612740: 0xff0C2340, //pelicans
  1610612758: 0xff5A2D81, //kings
  1610612761: 0xffCE1141, //raptors
  1610612750: 0xff0C2340, //wolves
  1610612739: 0xff860038, //cavs
  1610612760: 0xff007AC1, //thunder
  1610612753: 0xff0077C0, //magic
  1610612765: 0xffC8102E, //pistons
  1610612745: 0xffCE1141, //rockets
};

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
                activeColor: selectedBoxType == 0 ? Colors.blue
                    : Color(colorMap[selectedTeamType == 0 ?
                game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID] :
                game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!),
            ),
          ),
          selectedBoxType == 0 ? TeamBoxBody(statDuration: sliderMap[sliderValue.toInt()]!,)
              : PlayerBoxBody(statDuration: sliderMap[sliderValue.toInt()]!, team: teamMap[selectedTeamType]!)
        ],
      ),
    );
  }
}
