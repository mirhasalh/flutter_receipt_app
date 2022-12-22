import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/palette.dart';

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
            onTap: () => Navigator.of(context).pushNamed(
              LanguageSettingsPage.routeName,
              arguments:
                  LanguageSettingsArgs('${Localizations.localeOf(context)}'),
            ),
            tileColor: Colors.white,
            leading: const Icon(Icons.language_outlined),
            title: Text(AppLocalizations.of(context)!.languages),
            subtitle: Text(AppLocalizations.of(context)!.languageSubtitle),
          ),
        ],
      ),
    );
  }
}
