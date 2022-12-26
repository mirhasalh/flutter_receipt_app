import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/utils/prefs_utils.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {},
            title: const Text('Personalization'),
            subtitle: const Text('Manage your store informations'),
            tileColor: Colors.white,
            leading: const Icon(Icons.storefront_outlined, color: Colors.teal),
          ),
          const Divider(height: 0.0),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              LanguageSettingsPage.routeName,
              arguments:
                  LanguageSettingsArgs('${Localizations.localeOf(context)}'),
            ),
            tileColor: Colors.white,
            leading: const Icon(Icons.language_outlined, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.languages),
            subtitle: Text(AppLocalizations.of(context)!.languageSubtitle),
          ),
          const Divider(height: 0.0),
          ListTile(
            onTap: () {
              PrefsUtils().getLocaleForCurrencyIndex().then(
                    (index) => Navigator.of(context).pushNamed(
                      CurrencySettingsPage.routeName,
                      arguments: CurrencySettingsArgs(index),
                    ),
                  );
            },
            tileColor: Colors.white,
            leading: const Icon(Icons.attach_money, color: Colors.teal),
            title: const Text('Currency'),
            subtitle: const Text('Set currency symbol'),
          ),
        ],
      ),
    );
  }
}
