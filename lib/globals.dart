import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/game.dart';

bool onScores = true;
Game game = Game(valueMap: {});
Color awayColor = Colors.black;
Color homeColor = Colors.black;
const primaryColors = {
  1610612762: 0xff002B5C, //jazz
  1610612756: 0xffE56020, //suns
  1610612755: 0xff006BB6, //sixers
  1610612751: 0xff000000, //nets
  1610612743: 0xff0E2240, //nuggets
  1610612746: 0xffC8102E, //clippers
  1610612749: 0xff00471B, //bucks
  1610612742: 0xff00538C, //mavs
  1610612757: 0xffE03A3E, //blazers
  1610612747: 0xff552583, //lakers
  1610612752: 0xffF58426, //knicks
  1610612737: 0xffE03A3E, //hawks
  1610612748: 0xff98002E, //heat
  1610612744: 0xffFFC72C, //warriors
  1610612763: 0xff5D76A9, //grizzlies
  1610612738: 0xff007A33, //celtics
  1610612764: 0xffE31837, //wizards
  1610612754: 0xffFDBB30, //pacers
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
const secondaryColors = {
  1610612762: 0xff00471B, //jazz
  1610612756: 0xff1D1160, //suns
  1610612755: 0xffED174C, //sixers
  1610612751: 0xff000000, //nets
  1610612743: 0xffFEC524, //nuggets
  1610612746: 0xff1D428A, //clippers
  1610612749: 0xffEEE1C6, //bucks
  1610612742: 0xff002B5E, //mavs
  1610612757: 0xff000000, //blazers
  1610612747: 0xffFDB927, //lakers
  1610612752: 0xff006BB6, //knicks
  1610612737: 0xffC1D32F, //hawks
  1610612748: 0xffF9A01B, //heat
  1610612744: 0xff1D428A, //warriors
  1610612763: 0xff12173F, //grizzlies
  1610612738: 0xff007A33, //celtics
  1610612764: 0xff002B5C, //wizards
  1610612754: 0xff002D62, //pacers
  1610612766: 0xff00788C, //hornets
  1610612759: 0xffEF426F, //spurs
  1610612741: 0xff000000, //bulls
  1610612740: 0xffC8102E, //pelicans
  1610612758: 0xff63727A, //kings
  1610612761: 0xffB4975A, //raptors
  1610612750: 0xff78BE20, //wolves
  1610612739: 0xff041E42, //cavs
  1610612760: 0xffEF3B24, //thunder
  1610612753: 0xffC4CED4, //magic
  1610612765: 0xff1D42BA, //pistons
  1610612745: 0xff000000, //rockets
};
const belongsTo = {
  1610612762: "blue", //jazz
  1610612756: "none", //suns
  1610612755: "blue", //sixers
  1610612751: "none", //nets
  1610612743: "blue", //nuggets
  1610612746: "red", //clippers
  1610612749: "none", //bucks
  1610612742: "blue", //mavs
  1610612757: "red", //blazers
  1610612747: "none", //lakers
  1610612752: "none", //knicks
  1610612737: "red", //hawks
  1610612748: "red", //heat
  1610612744: "none", //warriors
  1610612763: "blue", //grizzlies
  1610612738: "none", //celtics
  1610612764: "red", //wizards
  1610612754: "none", //pacers
  1610612766: "blue", //hornets
  1610612759: "none", //spurs
  1610612741: "red", //bulls
  1610612740: "blue", //pelicans
  1610612758: "blue", //kings
  1610612761: "red", //raptors
  1610612750: "blue", //wolves
  1610612739: "red", //cavs
  1610612760: "blue", //thunder
  1610612753: "blue", //magic
  1610612765: "red", //pistons
  1610612745: "red", //rockets
};