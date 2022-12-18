import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/timed_page_route.dart';

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return TimedPageRoute(builder: (_) => const Auth());
    case '/home':
      return TimedPageRoute(builder: (_) => const Home());
    case '/settings':
      return TimedPageRoute(builder: (_) => const Settings());
    case '/language-settings':
      final args = settings.arguments as LanguageSettingsArgs;
      return TimedPageRoute(
        builder: (_) => LanguageSettings(locale: args.locale),
      );
    case '/item-list':
      return TimedPageRoute(builder: (_) => const ItemList());
    default:
      return TimedPageRoute(builder: (_) => const Auth());
  }
}
