import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/card_spacer.dart';

class OpenedChildFormat extends StatelessWidget {
  final Widget child;
  final bool bottom;

  const OpenedChildFormat({
    required this.child,
    required this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        bottom ? Container() : CardSpacer(header: false)
      ],
    );
  }
}
