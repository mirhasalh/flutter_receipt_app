enum Locales { en, id }

enum Currency { en, id }

class LocaleUtils {
  var localeAndSymbol = [
    {'locale': 'en_US', 'symbol': '\$'},
    {'locale': 'id_ID', 'symbol': 'Rp'}
  ];

  Locales getLang(String locale) {
    switch (locale) {
      case 'en_US':
        return Locales.en;
      case 'id_ID':
        return Locales.id;
      default:
        return Locales.en;
    }
  }

  Currency getCurrency(int index) {
    switch (index) {
      case 0:
        return Currency.en;
      case 1:
        return Currency.id;
      default:
        return Currency.en;
    }
  }
}
