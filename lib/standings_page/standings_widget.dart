import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/teams/team.dart';
import 'package:http/http.dart' as http;

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}
const op1 = ['EAST', 'WEST', 'LEAGUE'];
const op2 = ['NORMAL', 'ADVANCED'];
class _StandingsState extends State<Standings> {
  int _value = 0;
  int _value2 = 0;
  late Future<Map<String, dynamic>> standingsMap;

  Future<Map<String, dynamic>> fetchStandings() async {
    final response = await http
        .get(Uri.parse('https://nba-function.azurewebsites.net/standings'));
    Map<String, dynamic> standings = new Map();
    final apiData = jsonDecode(response.body)[0];
    standings['DATE'] = apiData['DATE'];
    standings['EAST'] = Map();
    standings['WEST'] = Map();
    for(var index = 0; index < 15; index++){ // 15 teams in each conference
      standings['EAST']['${index+1}'] = Team.fromJson(apiData['EAST'][index]);
      standings['WEST']['${index+1}'] = Team.fromJson(apiData['WEST'][index]);
    }
    return apiData;
  }

  @override
  void initState(){
    super.initState();
    standingsMap = fetchStandings();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Wrap(
              children: [
                for (var i = 0; i < op1.length; i++)
                  ChoiceChip(
                    label: Text(op1[i]),
                    selected: _value == i,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = i;
                      });
                    },
                  )
              ],
            ),
            Wrap(
              children: [
                for (var i = 0; i < op2.length; i++)
                  ChoiceChip(
                    label: Text(op2[i]),
                    selected: _value2 == i,
                    onSelected: (bool selected) {
                      setState(() {
                        _value2 = i;
                      });
                    },
                  )
              ],
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text("Selected ${op1[_value]} , ${op2[_value2]} "),
          ),
        ),
      ],
    );
  }
}
