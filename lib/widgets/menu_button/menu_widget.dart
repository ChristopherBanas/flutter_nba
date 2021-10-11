import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/globals.dart';
import 'package:flutter_nba/widgets/menu_button/info_body.dart';
import 'package:flutter_nba/widgets/menu_button/info_header.dart';
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
    return Draggable<SpeedDial>(
      feedback: FloatingActionButton(
        onPressed: () =>{},
        child: Icon(Icons.menu),
      ),
      childWhenDragging: Container(),
      child: SpeedDial(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        activeBackgroundColor: Theme.of(context).colorScheme.secondary,
        icon: Icons.menu,
        activeIcon: Icons.close,
        spacing: 3,
        childPadding: EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        buttonSize: 56,
        childrenButtonSize: 56,
        visible: true,
        direction: SpeedDialDirection.up,
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
                    title: InfoHeader(),
                    children: [
                      InfoBody(),
                    ],
                  ),
                ),
              },
          ),
        ],
      ),
    );
  }
}
