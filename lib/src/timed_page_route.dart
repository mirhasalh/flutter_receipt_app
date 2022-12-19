import 'package:flutter/material.dart';

class TimedPageRoute extends MaterialPageRoute {
  final int ms;

  TimedPageRoute({
    builder,
    this.ms = 820,
  }) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(milliseconds: ms);
}
