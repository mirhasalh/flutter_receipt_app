import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settings';

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              LanguageSettings.routeName,
              arguments:
                  LanguageSettingsArgs('${Localizations.localeOf(context)}'),
            ),
            tileColor: Colors.white,
            leading: const Icon(Icons.language_outlined),
            title: const Text('Languages'),
            subtitle: const Text('Set to your preferred language'),
          ),
        ],
      ),
    );
  }
}
