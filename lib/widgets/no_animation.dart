import 'package:flutter/material.dart';

class NoAnimationRoute extends MaterialPageRoute {
  NoAnimationRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}