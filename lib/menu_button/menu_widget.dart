
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/globals.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Menu extends StatefulWidget {
  final VoidCallback onFlip;

  const Menu({
    required this.onFlip
  });

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Theme.of(context).accentColor,
      activeBackgroundColor: Theme.of(context).accentColor,
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      childPadding: EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      buttonSize: 56,
      childrenButtonSize: 56,
      visible: true,
      direction: SpeedDialDirection.Up,
      closeManually: false,
      renderOverlay: true,
      tooltip: "Menu",
      useRotationAnimation: true,
      animationSpeed: 200,
      isOpenOnStart: false,
      shape: StadiumBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.sports_basketball),
          backgroundColor: Colors.orange.shade700,
          foregroundColor: Colors.white,
          label: "Scores",
          onTap: () => {
            if (!onScores){ //scores cant flip to scores
              widget.onFlip()
            }
          }
        ),
        SpeedDialChild(
            child: Icon(Icons.emoji_events),
            backgroundColor: Colors.yellow.shade800,
            foregroundColor: Colors.white,
            label: "Standings",
            onTap: () => {
              if (onScores){
                widget.onFlip()
              }
            }
        ),
        SpeedDialChild(
            child: Icon(Icons.info_outline_rounded),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            label: "About",
            onTap: () => {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                  title: Center(child: const Text("Info")),
                  children: [
                    Center(child: Text("Credits & dark mode / light mode button will go here")),
                  ],
                ),
              ),
            },
        ),
      ],
    );
  }
}