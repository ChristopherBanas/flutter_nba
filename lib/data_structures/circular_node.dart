import 'package:flutter_nba/widgets/games_page/parallax_card.dart';

class CircularNode{
  GameItem value;
  CircularNode? next;
  bool end;

  CircularNode(this.value, this.next, this.end);
}