import 'package:flutter/material.dart';
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
  late final _tileColor = Colors.white;
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
        title: const Text('Currency settings'),
      ),
      body: ListView(
        children: [
          RadioListTile(
            value: Currency.en,
            groupValue: _currency,
            onChanged: (currency) {
              setState(() {
                _currency = currency!;
              });

              PrefsUtils().setLocaleForCurrencyIndex(0);
            },
            tileColor: _tileColor,
            title: const Text('USD'),
            controlAffinity: _controlAffinity,
          ),
          const Divider(height: 0.0),
          RadioListTile(
            value: Currency.id,
            groupValue: _currency,
            onChanged: (currency) {
              setState(() {
                _currency = currency!;
              });

              PrefsUtils().setLocaleForCurrencyIndex(1);
            },
            tileColor: _tileColor,
            title: const Text('IDR'),
            controlAffinity: _controlAffinity,
          ),
        ],
      ),
    );
  }
}

class CurrencySettingsArgs {
  CurrencySettingsArgs(this.index);

  final int index;
}
