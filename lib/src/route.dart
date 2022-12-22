import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/timed_page_route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case '/document':
      return TimedPageRoute(builder: (_) => const DocumentPage());
    case '/settings':
      return TimedPageRoute(builder: (_) => const SettingsPage());
    case '/languageSettings':
      final args = settings.arguments as LanguageSettingsArgs;
      return TimedPageRoute(
        builder: (_) => LanguageSettingsPage(locale: args.locale),
      );
    case '/item':
      return TimedPageRoute(builder: (_) => const ItemPage());
    case '/addItem':
      return TimedPageRoute(builder: (_) => const AddItemPage());
    case '/supplier':
      return TimedPageRoute(builder: (_) => const SupplierPage());
    default:
      return TimedPageRoute(builder: (_) => const AuthPage());
  }
}
