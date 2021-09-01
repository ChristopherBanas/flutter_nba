import 'package:flutter/material.dart';
import 'package:flutter_nba/database_models/game.dart';

class InheritedCallBack extends InheritedWidget{
  const InheritedCallBack({
    required this.updateGameItem,
    required this.updateHidden,
    required Widget child,
  }) : super(child: child);

  final ValueSetter updateGameItem;
  final ValueSetter updateHidden;

  static InheritedCallBack of(BuildContext context) {
    final InheritedCallBack? result = context.dependOnInheritedWidgetOfExactType<InheritedCallBack>();
    assert(result != null, 'Not found');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedCallBack old) => updateGameItem != old.updateGameItem;
}