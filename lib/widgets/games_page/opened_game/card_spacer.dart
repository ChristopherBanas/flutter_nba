import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardSpacer extends StatelessWidget {
  final bool header;

  const CardSpacer({
    required this.header
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 5.5, top: 5.5),
      height: header ? 10 : 10,
      width: header ? double.infinity : double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.black
          ),
          bottom: BorderSide(
            color: Colors.black
          ),
        )
      ),
    );
  }
}
