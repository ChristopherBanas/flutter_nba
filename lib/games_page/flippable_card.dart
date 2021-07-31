import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlippableCard extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;

  const FlippableCard({
    required this.frontWidget,
    required this.backWidget
  });

  @override
  _FlippableCardState createState() => _FlippableCardState();
}

class _FlippableCardState extends State<FlippableCard> {
  late bool _showFrontSide;
  late bool _flipXAxis;
  late bool _flipping;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = false;
    _flipping = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints.tight(Size.square(200.0)),
      child: _buildFlipAnimation(),
    );
  }

  void _changeRotationAxis() {
    setState(() {
      _flipXAxis = !_flipXAxis;
    });
  }

  void _switchCard() {
    this.setState(() {
      _showFrontSide = !_showFrontSide;
      _flipping = true;
    });
  }


  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: () => {
        if (!_flipping){
          _switchCard()
        }
      },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 650),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim
            .value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)
            ..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)
            ..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.transparent,
      faceName: "Front",
      child: widget.frontWidget
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.transparent,
      faceName: "Rear",
      child: widget.backWidget
    );
  }

  Widget __buildLayout(
      {required Key key, required Widget child, required String faceName, required Color backgroundColor}) {
    return Container(
      key: key,
      // decoration: BoxDecoration(
      //   shape: BoxShape.rectangle,
      //   borderRadius: BorderRadius.circular(20.0),
      //   color: backgroundColor,
      // ),
      child: _showFrontSide ? widget.frontWidget : widget.backWidget
    );
  }
}