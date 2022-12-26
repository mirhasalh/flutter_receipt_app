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
      final args = settings.arguments as ItemPageArgs;
      return TimedPageRoute(
        builder: (_) => ItemPage(locale: args.locale, symbol: args.symbol),
      );
    case '/addItem':
      return TimedPageRoute(builder: (_) => const AddItemPage());
    case '/supplier':
      return TimedPageRoute(builder: (_) => const SupplierPage());
    case '/itemsDetails':
      final args = settings.arguments as ItemDetailsArgs;
      return TimedPageRoute(builder: (_) => ItemDetailsPage(item: args.item));
    case '/currencySettings':
      final args = settings.arguments as CurrencySettingsArgs;
      return TimedPageRoute(
        builder: (_) => CurrencySettingsPage(index: args.index),
      );
    default:
      return TimedPageRoute(builder: (_) => const AuthPage());
  }
}
