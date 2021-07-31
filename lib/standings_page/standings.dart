import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleBack extends StatefulWidget {
  @override
  _ExampleBackState createState() => _ExampleBackState();
}

class _ExampleBackState extends State<ExampleBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Standings'),
      ),
    );
  }
}
