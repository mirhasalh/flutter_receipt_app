import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/provider/theme_provider.dart';
import 'package:flutter_receipt_app/src/utils/prefs_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Settings { personalization, language, currency, theme }

class SettingsPage extends ConsumerStatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
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
        return AppLocalizations.of(context)!.personalization;
      case Settings.language:
        return AppLocalizations.of(context)!.languages;
      case Settings.currency:
        return AppLocalizations.of(context)!.currency;
      case Settings.theme:
        return AppLocalizations.of(context)!.themeMode;
      default:
        return 'n/a';
    }
  }

  Icon _getIcon(Settings settings) {
    switch (settings) {
      case Settings.language:
        return const Icon(Icons.language, color: Colors.teal);
      case Settings.currency:
        return const Icon(Icons.attach_money, color: Colors.teal);
      case Settings.personalization:
        return const Icon(Icons.storefront_outlined, color: Colors.teal);
      case Settings.theme:
        final theme = ref.watch(themeProvider).themeMode;
        return _getThemeIcon(theme);
      default:
        return const Icon(Icons.close, color: Colors.teal);
    }
  }

  Icon _getThemeIcon(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return const Icon(Icons.light_mode_outlined, color: Colors.teal);
      case ThemeMode.dark:
        return const Icon(Icons.dark_mode_outlined, color: Colors.teal);
      default:
        final brightness = MediaQuery.of(context).platformBrightness;
        if (brightness == Brightness.dark) {
          return const Icon(Icons.light_mode_outlined, color: Colors.teal);
        } else {
          return const Icon(Icons.light_mode_outlined, color: Colors.teal);
        }
    }
  }

  String _getSubtitle(Settings settings) {
    switch (settings) {
      case Settings.personalization:
        return AppLocalizations.of(context)!.personalizationSubtitle;
      case Settings.language:
        return AppLocalizations.of(context)!.languageSubtitle;
      case Settings.currency:
        return AppLocalizations.of(context)!.currencySubtitle;
      case Settings.theme:
        return AppLocalizations.of(context)!.themeModeSubtitle;
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
      case Settings.theme:
        Navigator.of(context).pushNamed(ThemeSettingsPage.routeName);
        return;
      default:
        return;
    }
  }
}
