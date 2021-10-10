import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StatSwitch extends StatelessWidget {
  final int initIndex;
  final ValueSetter callBack;
  final List<String> labels;
  final List<Color> colorList;

  const StatSwitch({
    required this.initIndex,
    required this.callBack,
    required this.labels,
    required this.colorList
  });

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 95.0,
      cornerRadius: 20.0,
      activeBgColors: [[colorList[0]], [colorList[1]]],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey.shade800,
      inactiveFgColor: Colors.white,
      initialLabelIndex: initIndex,
      totalSwitches: 2,
      labels: labels,
      radiusStyle: true,
      onToggle: (index) {
        callBack(index);
      },
    );
  }
}
