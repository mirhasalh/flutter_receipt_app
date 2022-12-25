import 'package:shared_preferences/shared_preferences.dart';

const kLocaleForCurrency = 'locale';

class PrefsUtils {
  Future<String> getLocaleForCurrency() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(kLocaleForCurrency).isEmpty) {
      return 'en_US';
    }

    return prefs.getString(kLocaleForCurrency);
  }

  Future<void> setLocaleForCurrency(String locale) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(kLocaleForCurrency, locale);
  }
}
