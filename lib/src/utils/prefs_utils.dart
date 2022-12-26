import 'package:shared_preferences/shared_preferences.dart';

const kLocaleForCurrencyIndex = 'locale';

class PrefsUtils {
  Future<int> getLocaleForCurrencyIndex() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getInt(kLocaleForCurrencyIndex) == null) {
      prefs.setInt(kLocaleForCurrencyIndex, 0);
    }

    return prefs.getInt(kLocaleForCurrencyIndex)!;
  }

  Future<void> setLocaleForCurrencyIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt(kLocaleForCurrencyIndex, index);
  }
}
