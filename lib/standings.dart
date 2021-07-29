import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleBack extends StatefulWidget {
  const ExampleBack({
    Key? key, this.onFlip
  }) : super(key: key);
  final VoidCallback? onFlip;

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
