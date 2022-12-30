import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/utils/locale_utils.dart';
import 'package:flutter_receipt_app/src/utils/prefs_utils.dart';

class CurrencySettingsPage extends StatefulWidget {
  static const routeName = '/currencySettings';

  const CurrencySettingsPage({super.key, required this.index});

  final int index;

  @override
  State<CurrencySettingsPage> createState() => _CurrencySettingsPageState();
}

class _CurrencySettingsPageState extends State<CurrencySettingsPage> {
  late Currency _currency;
  final _controlAffinity = ListTileControlAffinity.trailing;

  @override
  void initState() {
    super.initState();
    _currency = LocaleUtils().getCurrency(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.currency),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final currency = Currency.values[index];
          return RadioListTile(
            value: currency,
            groupValue: _currency,
            onChanged: (value) {
              setState(() => _currency = value!);

              _onChangeCurrency(_currency);
            },
            controlAffinity: _controlAffinity,
            title: Text(_getTitle(currency)),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0.0),
        itemCount: Currency.values.length,
      ),
    );
  }

  void _onChangeCurrency(Currency currency) {
    switch (currency) {
      case Currency.en:
        PrefsUtils().setLocaleForCurrencyIndex(0);
        return;
      case Currency.id:
        PrefsUtils().setLocaleForCurrencyIndex(1);
        return;
      default:
        return;
    }
  }

  String _getTitle(Currency currency) {
    switch (currency) {
      case Currency.en:
        return 'USD';
      case Currency.id:
        return 'IDR';
      default:
        return 'n/a';
    }
  }
}

class CurrencySettingsArgs {
  CurrencySettingsArgs(this.index);

  final int index;
}
