import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/teams/team.dart';
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
  late Map<String, dynamic> standingsMap;

  Future<Map<String, dynamic>> fetchStandings() async {
    final response = await http
        .get(Uri.parse('https://nba-function.azurewebsites.net/standings'));
    Map<String, dynamic> standings = new Map();
    final apiData = jsonDecode(response.body)[0];
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

  @override
  void initState(){
    super.initState();
    fetchStandings().then((Map<String, dynamic> value) => {this.setState(() {
      standingsMap = value;
    })});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
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
          ],
        ),
        Expanded(
          child: Center(
            child: StandingsTable(
                teams: standingsMap['EAST'].values.toList(),
                colLength: 13, //advanced
            ),
          ),
        ),
      ],
    );
  }
}
