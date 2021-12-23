import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartTemplate extends StatelessWidget {
  final Widget child;

  const ChartTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7.5, right: 7.5),
      child: AspectRatio(
        aspectRatio: .85,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              color: Theme.of(context).scaffoldBackgroundColor
          ),
          child: child
        ),
      ),
    );
  }
}
