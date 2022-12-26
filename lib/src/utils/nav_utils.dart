import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/db/item.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/utils/locale_utils.dart';
import 'package:flutter_receipt_app/src/utils/prefs_utils.dart';

// Put navigate here when its getting complex
class NavUtils {
  var localeAndSymbol = LocaleUtils().localeAndSymbol;

  void toItemPage(BuildContext context) {
    PrefsUtils().getLocaleForCurrencyIndex().then((i) {
      var locale = localeAndSymbol[i]['locale']!;
      var symbol = localeAndSymbol[i]['symbol']!;

      Navigator.of(context).pushNamed(ItemPage.routeName,
          arguments: ItemPageArgs(locale, symbol));
    });
  }

  void toItemDetails(BuildContext context, Item item) {
    PrefsUtils().getLocaleForCurrencyIndex().then((i) {
      var locale = localeAndSymbol[i]['locale']!;

      Navigator.of(context).pushNamed(
        ItemDetailsPage.routeName,
        arguments: ItemDetailsArgs(item, locale),
      );
    });
  }
}
