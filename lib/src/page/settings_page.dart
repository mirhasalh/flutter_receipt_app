import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/utils/prefs_utils.dart';

enum Settings { personalization, language, currency }

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _tileColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final settings = Settings.values[index];
          return ListTile(
            onTap: () => _onTapSettings(settings),
            title: Text(_getTitle(settings)),
            tileColor: _tileColor,
            leading: _getIcon(settings),
            subtitle: Text(_getSubtitle(settings)),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0.0),
        itemCount: Settings.values.length,
      ),
    );
  }

  String _getTitle(Settings settings) {
    switch (settings) {
      case Settings.personalization:
        return 'Personalization';
      case Settings.language:
        return AppLocalizations.of(context)!.languages;
      case Settings.currency:
        return 'Currency';
      default:
        return 'n/a';
    }
  }

  Icon _getIcon(Settings settings) {
    switch (settings) {
      case Settings.language:
        return const Icon(Icons.storefront_outlined, color: Colors.teal);
      case Settings.currency:
        return const Icon(Icons.attach_money, color: Colors.teal);
      case Settings.personalization:
        return const Icon(Icons.storefront_outlined, color: Colors.teal);
      default:
        return const Icon(Icons.close, color: Colors.teal);
    }
  }

  String _getSubtitle(Settings settings) {
    switch (settings) {
      case Settings.personalization:
        return 'Manage your store informations';
      case Settings.language:
        return AppLocalizations.of(context)!.languageSubtitle;
      case Settings.currency:
        return 'Set currency symbol';
      default:
        return 'n/a';
    }
  }

  void _onTapSettings(Settings settings) {
    switch (settings) {
      case Settings.personalization:
        Navigator.of(context).pushNamed(InfoPage.routeName);
        return;
      case Settings.language:
        Navigator.of(context).pushNamed(
          LanguageSettingsPage.routeName,
          arguments: LanguageSettingsArgs('${Localizations.localeOf(context)}'),
        );
        return;
      case Settings.currency:
        PrefsUtils().getLocaleForCurrencyIndex().then(
              (index) => Navigator.of(context).pushNamed(
                CurrencySettingsPage.routeName,
                arguments: CurrencySettingsArgs(index),
              ),
            );
        return;
      default:
        return;
    }
  }
}
