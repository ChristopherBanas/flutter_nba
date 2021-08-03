import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}
const op1 = ['EAST', 'WEST', 'LEAGUE'];
const op2 = ['NORMAL', 'ADVANCED'];
class _StandingsState extends State<Standings> {
  int _value = 0;
  int _value2 = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Wrap(
              children: [
                for (var i = 0; i < op1.length; i++)
                  ChoiceChip(
                    label: Text(op1[i]),
                    selected: _value == i,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = i;
                      });
                    },
                  )
              ],
            ),
            Wrap(
              children: [
                for (var i = 0; i < op2.length; i++)
                  ChoiceChip(
                    label: Text(op2[i]),
                    selected: _value2 == i,
                    onSelected: (bool selected) {
                      setState(() {
                        _value2 = i;
                      });
                    },
                  )
              ],
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text("Selected ${op1[_value]} , ${op2[_value2]} "),
          ),
        ),
      ],
    );
  }
}
