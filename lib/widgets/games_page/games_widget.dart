// Based on: https://flutter.dev/docs/cookbook/effects/parallax-scrolling

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/models/game.dart';
import 'package:flutter_nba/widgets/games_page/parallax_card.dart';
import 'package:http/http.dart' as http;

class GamesWidget extends StatefulWidget {
  final List<Game> gamesList;

  const GamesWidget({
    required this.gamesList,
  });

  @override
  GamesWidgetState createState() => GamesWidgetState();
}

double pos = 0.0;

class GamesWidgetState extends State<GamesWidget> {
  late ScrollController controller;
  late List<Widget> gameList;

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
    controller = new ScrollController()..addListener(() {scrollListener();});
    gameList = generateGames();
  }

  @override
  void dispose() {
    controller.removeListener(() {scrollListener();});
    super.dispose();
  }

  List<GameItem> generateGames(){
    List<GameItem> list = [];
    for (final game in widget.gamesList){
      bool last = (widget.gamesList.last == game) ? true : false;
      list.add(GameItem(
          image: game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.WL] == "L" ?
          imageMap[game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.HOME][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]! :
          imageMap[game.valueMap[gameEnums.TEAM_BOX_SCORE][gameEnums.AWAY][gameEnums.TOTAL].valueMap[boxEnums.TEAM_ID]]!,
          game: game,
          last: last
      ));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Games"),
          toolbarHeight: 100,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: SizedBox(
              height: 30,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    //widget.gamesList[0].valueMap[gameEnums.DATE],
                    '12/25/2020',
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
          //key: PageStorageKey(value),
          controller: controller,
          child: Column(
            children: [
              for(final game in gameList)
                game
            ],
          ),
        ),
      ),
    );
  }
  void scrollListener(){
    //print(controller.offset);
    pos = controller.offset;
    // print('pos $pos');
    if ((controller.offset + 100) >= controller.position.maxScrollExtent){ //at bottom
      //CircularLinkedList newLinkedList = CircularLinkedList(circularGameList.head!.next);
      List<Widget> newList = this.gameList;
      Widget replace = newList.removeAt(0);
      newList.add(replace);
      //controller.keepScrollOffset
      //print('jumping down ${controller.offset/widget.gamesList.length}');
      controller.jumpTo(controller.offset - ((controller.offset / widget.gamesList.length) + (widget.gamesList.length * 29)));
      this.setState(() {
        //circularGameList = newLinkedList;
        gameList = newList;
      });
    }
  }
}

const imageMap = {
  1610612762: 'assets/images/jazz.jpg', //jazz
  1610612756: 'assets/images/suns.jpg', //suns
  1610612755: 'assets/images/sixers.jpg', //sixers
  1610612751: 'assets/images/nets.jpg', //nets
  1610612743: 'assets/images/nuggets.jpg', //nuggets
  1610612746: 'assets/images/clippers.jpg', //clippers
  1610612749: 'assets/images/bucks.jpg', //bucks
  1610612742: 'assets/images/mavericks.jpg', //mavs
  1610612757: 'assets/images/blazers.jpg', //blazers
  1610612747: 'assets/images/lakers.jpg', //lakers
  1610612752: 'assets/images/knicks.jpg', //knicks
  1610612737: 'assets/images/hawks.jpeg', //hawks
  1610612748: 'assets/images/heat.jpg', //heat
  1610612744: 'assets/images/warriors.jpg', //warriors
  1610612763: 'assets/images/grizzlies.jpg', //grizzlies
  1610612738: 'assets/images/celtics.jpg', //celtics
  1610612764: 'assets/images/wizards.jpg', //wizards
  1610612754: 'assets/images/pacers.jpg', //pacers
  1610612766: 'assets/images/hornets.jpg', //hornets
  1610612759: 'assets/images/spurs.jpeg', //spurs
  1610612741: 'assets/images/bulls.jpg', //bulls
  1610612740: 'assets/images/pelicans.jpg', //pelicans
  1610612758: 'assets/images/kings.jpg', //kings
  1610612761: 'assets/images/raptors.jpg', //raptors
  1610612750: 'assets/images/timberwolves.jpg', //wolves
  1610612739: 'assets/images/cavs.jpg', //cavs
  1610612760: 'assets/images/thunder.jpg', //thunder
  1610612753: 'assets/images/magic.jpg', //magic
  1610612765: 'assets/images/pistons.jpg', //pistons
  1610612745: 'assets/images/rockets.jpg', //rockets
};