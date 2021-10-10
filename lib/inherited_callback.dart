/// Used to provide children with a way to change the theme of the app
import 'package:flutter/material.dart';

class InheritedCallBack extends InheritedWidget{
  const InheritedCallBack({
    required this.callBack,
    required Widget child,
  }) : super(child: child);

  final ValueSetter callBack;

  static InheritedCallBack of(BuildContext context) {
    final InheritedCallBack? result = context.dependOnInheritedWidgetOfExactType<InheritedCallBack>();
    assert(result != null, 'Not found');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedCallBack old) => callBack != old.callBack;
}