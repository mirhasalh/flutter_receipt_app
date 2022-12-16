import 'package:flutter/material.dart';

class TimedPageRoute extends MaterialPageRoute {
  TimedPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 820);
}
