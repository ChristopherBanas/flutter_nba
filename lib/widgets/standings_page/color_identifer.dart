import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorIdentifier extends StatelessWidget {
  final Color color;
  final String text;

  const ColorIdentifier({
    required this.color, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 35,
          child: Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(text),
        )
      ],
    );
  }
}
