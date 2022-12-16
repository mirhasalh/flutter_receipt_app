import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/timed_page_route.dart';

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return TimedPageRoute(builder: (_) => const Auth());
    case '/home':
      return TimedPageRoute(builder: (_) => const Home());
    default:
      return TimedPageRoute(builder: (_) => const Auth());
  }
}
