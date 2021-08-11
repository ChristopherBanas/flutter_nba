import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/team.dart';
import 'package:flutter_nba/enums.dart';
import 'package:flutter_nba/standings_page/data_table.dart';
import 'package:http/http.dart' as http;

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

const conferences = const ['EAST', 'WEST', 'LEAGUE'];
const statTypes = const ['NORMAL', 'ADVANCED'];

class _StandingsState extends State<Standings> {
  int selectedConference = 0;
  int selectedStatType = 0;
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
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: standingsMap,
      builder: (ctx, snapshot) {
        //only way I could get the Future map to just be a map
        var standings = snapshot.hasData ? snapshot.data as LinkedHashMap <String, dynamic> : null;
        if (snapshot.hasData){
           return Column(
                children: [
                  Wrap(
                    children: [
                      for (var i = 0; i < conferences.length; i++)
                        ChoiceChip(
                          label: Text(conferences[i]),
                          selected: selectedConference == i,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedConference = i;
                            });
                          },
                        )
                    ],
                  ),
                  Wrap(
                    children: [
                      for (var i = 0; i < statTypes.length; i++)
                        ChoiceChip(
                          label: Text(statTypes[i]),
                          selected: selectedStatType == i,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedStatType = i;
                            });
                          },
                        )
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: StandingsTable(
                        teams: standings![conferences[selectedConference]].values.toList(),
                        headers: statTypes[selectedStatType] == 'NORMAL' ?
                          standings[conferences[selectedConference]].values.toList()[0].valueMap[teamEnums.normalStats].valueMap.keys.toList()
                          : standings[conferences[selectedConference]].values.toList()[0].valueMap[teamEnums.advancedStats].valueMap.keys.toList(),
                        normal: statTypes[selectedStatType] == 'NORMAL' ? true : false,
                        league: conferences[selectedConference] == 'LEAGUE' ? true : false,
                        date: standings['DATE']
                      ),
                    ),
                  ),
                ],
              );
        }
        return Center(
            child: CircularProgressIndicator(),
        );
      },
    );
  }
}
