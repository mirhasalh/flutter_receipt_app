import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/constant/duration.dart';

class TimedPageRoute extends MaterialPageRoute {
  TimedPageRoute({
    builder,
    this.time = kTimeRoute,
  }) : super(builder: builder);

  Duration time;

  @override
  Duration get transitionDuration => time;
}
