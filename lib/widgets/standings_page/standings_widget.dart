import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/widgets/standings_page/standings_body.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';
import 'package:http/http.dart' as http;

class StandingsWidget extends StatefulWidget {
  final Map<String, dynamic> standingsMap;

  const StandingsWidget({
    required this.standingsMap
  });

  @override
  StandingsWidgetState createState() => StandingsWidgetState();
}

const conferences = const ['EAST', 'WEST', 'LEAGUE'];

class StandingsWidgetState extends State<StandingsWidget> with SingleTickerProviderStateMixin{
  late TabController _tabController;

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Standings"),
          toolbarHeight: 75,
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
              standingsMap: widget.standingsMap,
              conference: 'EAST'
          ),
          StandingsBody(
              standingsMap: widget.standingsMap,
              conference: 'WEST'
          ),
          StandingsBody(
              standingsMap: widget.standingsMap,
              conference: 'LEAGUE'
          ),
        ][_tabController.index]
    );
  }
}
