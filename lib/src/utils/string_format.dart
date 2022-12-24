import 'package:intl/intl.dart';

class StringFormat {
  String currency(String locale, String text) {
    if (text.isEmpty || text == '') {
      return NumberFormat.currency(locale: locale).format(0);
    }

    return NumberFormat.currency(locale: locale).format(double.parse(text));
  }
}
