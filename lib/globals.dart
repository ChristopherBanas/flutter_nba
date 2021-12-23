import 'package:flutter/cupertino.dart';

import 'models/game.dart';

bool onScores = true;
Game game = Game(valueMap: {});
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
  1610612744: 0xffFFC72C, //warriors
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
Map<dynamic, Image> imageMap = {};