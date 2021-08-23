// Based on: https://flutter.dev/docs/cookbook/effects/parallax-scrolling

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/widgets/database_models/game.dart';
import 'package:flutter_nba/widgets/games_page/parallax_card.dart';
import 'package:http/http.dart' as http;

class GamesWidget extends StatefulWidget {
  final List<Game> gamesList;

  const GamesWidget({
    required this.gamesList
  });

  @override
  GamesWidgetState createState() => GamesWidgetState();
}

class GamesWidgetState extends State<GamesWidget> {


  List<Game> calculateGames(apiData){
    List<Game> games = [];
    for (final gameJson in apiData){
      games.add(Game.fromJson(gameJson));
    }
    return games;
  }

  Future<List<Game>> getAPIData() async{
    final response = await http
        .get(Uri.parse('https://nba-function.azurewebsites.net/games/month/12/day/22/year/2020'));
    final apiData = jsonDecode(response.body);
    return calculateGames(apiData);
  }

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
        toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromWidth(1),
          child: SizedBox(
            height: 30,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  //widget.gamesList[0].valueMap[gameEnums.DATE],
                  '12/22/2020',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final game in widget.gamesList)
              GameItem(
                  image: game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY].valueMap[boxEnums.WL] == "L" ?
                    imageMap[game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME].valueMap[boxEnums.TEAM_ID]]! :
                      imageMap[game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY].valueMap[boxEnums.TEAM_ID]]!,
                  gameModel: game
              )
          ],
        ),
      ),
    );
  }
}


const imageMap = {
  1610612762: 'images/jazz.jpg', //jazz
  1610612756: 'images/suns.jpg', //suns
  1610612755: 'images/sixers.jpg', //sixers
  1610612751: 'images/nets.jpg', //nets
  1610612743: 'images/nuggets.jpg', //nuggets
  1610612746: 'images/clippers.jpg', //clippers
  1610612749: 'images/bucks.jpg', //bucks
  1610612742: 'images/mavericks.jpg', //mavs
  1610612757: 'images/blazers.jpg', //blazers
  1610612747: 'images/lakers.jpg', //lakers
  1610612752: 'images/knicks.jpg', //knicks
  1610612737: 'images/hawks.jpeg', //hawks
  1610612748: 'images/heat.jpg', //heat
  1610612744: 'images/warriors.jpg', //warriors
  1610612763: 'images/grizzlies.jpg', //grizzlies
  1610612738: 'images/celtics.jpg', //celtics
  1610612764: 'images/wizards.jpg', //wizards
  1610612754: 'images/pacers.jpg', //pacers
  1610612766: 'images/hornets.jpg', //hornets
  1610612759: 'images/spurs.jpeg', //spurs
  1610612741: 'images/bulls.jpg', //bulls
  1610612740: 'images/pelicans.jpg', //pelicans
  1610612758: 'images/kings.jpg', //kings
  1610612761: 'images/raptors.jpg', //raptors
  1610612750: 'images/timberwolves.jpg', //wolves
  1610612739: 'images/cavs.jpg', //cavs
  1610612760: 'images/thunder.jpg', //thunder
  1610612753: 'images/magic.jpg', //magic
  1610612765: 'images/pistons.jpg', //pistons
  1610612745: 'images/rockets.jpg', //rockets
};