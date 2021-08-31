import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'inherited_call_back.dart';

class GameCard extends StatefulWidget {
  final bool hidden;

  const GameCard({
    required this.hidden
  });
  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {

  @override
  Widget build(BuildContext context) {
    return widget.hidden ? Container() :
    Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 200,
              child: Card(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
              child: Container(
                height: 35,
                width: 300,
                child: Card(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
