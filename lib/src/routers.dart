import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRoute(builder: (_) => const Auth());
      case '/home':
        return PageRoute(builder: (_) => const Home());
      default:
        return PageRoute(builder: (_) => const Auth());
    }
  }
}

class PageRoute extends MaterialPageRoute {
  PageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 820);
}
