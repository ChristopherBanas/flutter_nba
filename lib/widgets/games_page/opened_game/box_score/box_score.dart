import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../stat_switch.dart';

class BoxScoreBody extends StatefulWidget {
  const BoxScoreBody({Key? key}) : super(key: key);

  @override
  _BoxScoreBodyState createState() => _BoxScoreBodyState();
}

const dict = {0: "Q1",20: "Q2",40: "H!",60: "Q3",80: "Q4",100: "H2",120: "T",};
class _BoxScoreBodyState extends State<BoxScoreBody> {
  int selectedStatType = 0;
  double value = 0.0;
  double value2 = 0.0;

  /// Handled callback to change numeric value into a custom text.
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StatSwitch(
              initIndex: selectedStatType,
              labels: ['TEAM', 'PLAYER'],
              callBack: (index) => {
                this.setState(() {
                  selectedStatType = index;
                })
              }
          ),
          Slider(
            value: value,
            min: 0,
            max: 120,
            divisions: 6,
            label: dict[value],
            onChanged: (double val) {
              setState(() {
                value = val;
              });
            },
          ),
          SfSlider(
              min: 0,
              stepSize: 20,
              max: 120,
              interval: 20,
              value: value2,
              enableTooltip: true,
              labelFormatterCallback: _handleLabelCreated,
              showTicks: true,
              showLabels: true,
              onChanged: (dynamic val) {
                setState(() {
                  value2 = val;
                });
              },
          ),
        ],
      ),
    );
  }
}