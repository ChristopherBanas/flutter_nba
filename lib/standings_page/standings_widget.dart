import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/standings_page/standings_body.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';
import 'package:http/http.dart' as http;

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

const conferences = const ['EAST', 'WEST', 'LEAGUE'];

class _StandingsState extends State<Standings> with SingleTickerProviderStateMixin{
  int selectedConference = 0;
  late TabController _tabController;
  late Future<Map<String, dynamic>> standingsMap;

  Map<String, dynamic> calculateStandings(apiData) {
    Map<String, dynamic> standings = new Map();
    LinkedHashMap<String, Team> eastMap = new LinkedHashMap();
    LinkedHashMap<String, Team> westMap = new LinkedHashMap();
    for(var index = 0; index < 15; index++){ // 15 teams in each conference
      var eastId = apiData['EAST'][index]['TeamID'];
      var westId = apiData['WEST'][index]['TeamID'];
      eastMap['$eastId'] = Team.fromJson(apiData['EAST'][index]);
      westMap['$westId'] = Team.fromJson(apiData['WEST'][index]);
    }
    standings['EAST'] = eastMap;
    standings['WEST'] = westMap;
    LinkedHashMap<String, Team> leagueMap = new LinkedHashMap();
    for (final team in apiData['LEAGUE']){
      var teamId = team['TeamID'];
      if (team['Conference'] == 'East'){
        leagueMap['$teamId'] = standings['EAST']['$teamId'];
      } else{
        leagueMap['$teamId'] = standings['WEST']['$teamId'];
      }
    }
    standings['DATE'] = apiData['DATE'];
    standings['LEAGUE'] = leagueMap;
    return standings;
  }

  Future<Map<String, dynamic>> getAPIData() async {
    final response = await http
        .get(Uri.parse('https://nba-function.azurewebsites.net/standings'));
    // final response = await http
    //     .get(Uri.parse('http://localhost:7071/standings'));
    final apiData = jsonDecode(response.body)[0];
    return calculateStandings(apiData);
  }

  @override
  void initState(){
    super.initState();
    standingsMap = getAPIData();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,dynamic>>(
      future: standingsMap,
      builder: (ctx, snapshot) {
        if (snapshot.hasData){
           return Scaffold(
             appBar: AppBar(
               title: Text("Standings"),
               toolbarHeight: 100,
               bottom: TabBar(
                 controller: _tabController,
                 tabs: [
                   for (final conf in conferences)
                     Padding(
                       padding: const EdgeInsets.only(bottom: 15),
                       child: Text(conf),
                     )
                 ],
                 indicator: PointTabIndicator(
                   position: PointTabIndicatorPosition.bottom,
                   color: Colors.white,
                   insets: EdgeInsets.only(bottom: 6)
                 ),
               ),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.vertical(
                   bottom: Radius.circular(20),
                 ),
               ),
             ),
             body: [
               StandingsBody(
                   standingsMap: snapshot.data!,
                   conference: 'EAST'
               ),
               StandingsBody(
                   standingsMap: snapshot.data!,
                   conference: 'WEST'
               ),
               StandingsBody(
                   standingsMap: snapshot.data!,
                   conference: 'LEAGUE'
               ),
             ][_tabController.index]
           );
        }
        return Center(
            child: CircularProgressIndicator(),
        );
      },
    );
  }
}
