import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeProvider = ChangeNotifierProvider((ref) => LocaleProvider());

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocaleToId() {
    _locale = const Locale('id', 'ID');

    notifyListeners();
  }

  void resetLocale() {
    _locale = const Locale('en', 'US');

    notifyListeners();
  }
}
