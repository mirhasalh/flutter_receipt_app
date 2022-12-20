import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = ChangeNotifierProvider((ref) => LocaleProvider());

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setToId() {
    _locale = const Locale('id', 'ID');

    notifyListeners();
  }

  void reset() {
    _locale = const Locale('en', 'US');

    notifyListeners();
  }
}
