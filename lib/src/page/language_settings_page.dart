import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/provider/locale_provider.dart';
import 'package:flutter_receipt_app/src/utils/locale_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageSettingsPage extends ConsumerStatefulWidget {
  static const routeName = '/languageSettings';

  const LanguageSettingsPage({super.key, required this.locale});

  final String locale;

  @override
  LanguageSettingsState createState() => LanguageSettingsState();
}

class LanguageSettingsState extends ConsumerState<LanguageSettingsPage> {
  late Locales _lang;
  final _tileColor = Colors.white;
  final _controlAffinity = ListTileControlAffinity.trailing;

  @override
  void initState() {
    super.initState();
    _lang = LocaleUtils().getLang(widget.locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageSettings),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final locale = Locales.values[index];
          return RadioListTile(
            title: Text(_getTitle(locale)),
            value: locale,
            groupValue: _lang,
            onChanged: (value) {
              setState(() => _lang = value!);
              _onChangeLang(_lang);
            },
            controlAffinity: _controlAffinity,
            tileColor: _tileColor,
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0.0),
        itemCount: Locales.values.length,
      ),
    );
  }

  String _getTitle(Locales locale) {
    switch (locale) {
      case Locales.en:
        return AppLocalizations.of(context)!.english;
      case Locales.id:
        return AppLocalizations.of(context)!.indonesian;
      default:
        return 'n/a';
    }
  }

  void _onChangeLang(Locales locale) {
    switch (locale) {
      case Locales.en:
        return ref.read(localeProvider).reset();
      case Locales.id:
        return ref.read(localeProvider).setToId();
      default:
        return ref.read(localeProvider).reset();
    }
  }
}

class LanguageSettingsArgs {
  LanguageSettingsArgs(this.locale);

  final String locale;
}
