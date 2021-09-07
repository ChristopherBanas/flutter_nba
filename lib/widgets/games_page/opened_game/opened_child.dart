import 'package:flutter/cupertino.dart';
import 'package:flutter_nba/widgets/games_page/opened_game/card_spacer.dart';

class OpenedChildFormat extends StatelessWidget {
  final String name;
  final Widget child;

  const OpenedChildFormat({
    required this.name,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        CardSpacer(header: false)
      ],
    );
  }
}
