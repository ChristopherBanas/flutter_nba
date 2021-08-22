// Based on: https://flutter.dev/docs/cookbook/effects/parallax-scrolling

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nba/widgets/database_models/game.dart';
import 'package:flutter_nba/widgets/games_page/flippable_card.dart';
import 'package:flutter_nba/widgets/games_page/parallax_card.dart';
import 'package:http/http.dart' as http;

class GamesParallaxList extends StatefulWidget {

  @override
  _GamesParallaxListState createState() => _GamesParallaxListState();
}

class _GamesParallaxListState extends State<GamesParallaxList> {
  late List<GameModel> gamesMap;

  List<GameModel> calculateGames(apiData){
    List<GameModel> games = [];
    for (final gameJson in apiData){
      games.add(GameModel.fromJson(gameJson));
    }
    return games;
  }

  Future<List<GameModel>> getAPIData() async{
    final response = await http
        .get(Uri.parse('https://nba-function.azurewebsites.net/games/month/12/day/22/year/2020'));
    // final response = await http
    //     .get(Uri.parse('http://localhost:7071/standings'));
    final apiData = jsonDecode(response.body);
    return calculateGames(apiData);
  }

  @override
  void initState(){
    super.initState();
    getAPIData();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final team in teams)
            GameItem(
              imageUrl: team.imageUrl,
              name: team.name,
              country: team.place,
            ),
        ],
      ),
    );
  }
}




const teams = [
  Game(
    name: 'Celtics',
    place: 'Boston',
    imageUrl: 'images/celtics.jpg',
  ),
  Game(
    name: 'Knicks',
    place: 'New York',
    imageUrl: 'images/knicks.jpg',
  ),
  Game(
    name: 'Nets',
    place: 'Brooklyn',
    imageUrl: 'images/nets.jpg',
  ),
  Game(
    name: 'Sixers',
    place: 'Philadelphia',
    imageUrl: 'images/sixers.jpg',
  ),
  Game(
    name: 'Raptors',
    place: 'Toronto',
    imageUrl: 'images/raptors.jpg',
  ),
  Game(
    name: 'Bulls',
    place: 'Chicago',
    imageUrl: 'images/bulls.jpg',
  ),
  Game(
    name: 'Cavaliers',
    place: 'Cleveland',
    imageUrl: 'images/cavs.jpg',
  ),
  Game(
    name: 'Pistons',
    place: 'Detroit',
    imageUrl: 'images/pistons.jpg',
  ),
  Game(
    name: 'Pacers',
    place: 'Indianapolis',
    imageUrl: 'images/pacers.jpg',
  ),
  Game(
    name: 'Bucks',
    place: 'Milwaukee',
    imageUrl: 'images/bucks.jpg',
  ),
  Game(
    name: 'Hawks',
    place: 'Atlanta',
    imageUrl: 'images/hawks.jpeg',
  ),
  Game(
    name: 'Hornets',
    place: 'Charlotte',
    imageUrl: 'images/hornets.jpg',
  ),
  Game(
    name: 'Heat',
    place: 'Miami',
    imageUrl: 'images/heat.jpg',
  ),
  Game(
    name: 'Magic',
    place: 'Orlando',
    imageUrl: 'images/magic.jpg',
  ),
  Game(
    name: 'Wizards',
    place: 'Washington',
    imageUrl: 'images/wizards.jpg',
  ),
  Game(
    name: 'Nuggets',
    place: 'Denver',
    imageUrl: 'images/nuggets.jpg',
  ),
  Game(
    name: 'Timberwolves',
    place: 'Minneapolis',
    imageUrl: 'images/timberwolves.jpg',
  ),
  Game(
    name: 'Thunder',
    place: 'Oklahoma City',
    imageUrl: 'images/thunder.jpg',
  ),
  Game(
    name: 'Blazers',
    place: 'Portland',
    imageUrl: 'images/blazers.jpg',
  ),
  Game(
    name: 'Jazz',
    place: 'Salt Lake City',
    imageUrl: 'images/jazz.jpg',
  ),
  Game(
    name: 'Warriors',
    place: 'San Francisco',
    imageUrl: 'images/warriors.jpg',
  ),
  Game(
    name: 'Clippers',
    place: 'Los Angeles',
    imageUrl: 'images/clippers.jpg',
  ),
  Game(
    name: 'Lakers',
    place: 'Los Angeles',
    imageUrl: 'images/lakers.jpg',
  ),
  Game(
    name: 'Suns',
    place: 'Phoenix',
    imageUrl: 'images/suns.jpg',
  ),
  Game(
    name: 'Kings',
    place: 'Sacramento',
    imageUrl: 'images/kings.jpg',
  ),
  Game(
    name: 'Mavericks',
    place: 'Dallas',
    imageUrl: 'images/mavericks.jpg',
  ),
  Game(
    name: 'Rockets',
    place: 'Houston',
    imageUrl: 'images/rockets.jpg',
  ),
  Game(
    name: 'Grizzlies',
    place: 'Memphis',
    imageUrl: 'images/grizzlies.jpg',
  ),
  Game(
    name: 'Spurs',
    place: 'San Antonio',
    imageUrl: 'images/spurs.jpeg',
  ),
  Game(
    name: 'Pelicans',
    place: 'New Orleans',
    imageUrl: 'images/pelicans.jpg',
  ),
];