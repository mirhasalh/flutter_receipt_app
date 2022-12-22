import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/provider/locale_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Lang { en, id }

class LanguageSettingsPage extends ConsumerStatefulWidget {
  static const routeName = '/languageSettings';

  const LanguageSettingsPage({super.key, required this.locale});

  final String locale;

  @override
  LanguageSettingsState createState() => LanguageSettingsState();
}

class LanguageSettingsState extends ConsumerState<LanguageSettingsPage> {
  late Lang _lang;
  final _tileColor = Colors.white;
  final _controlAffinity = ListTileControlAffinity.trailing;

  @override
  void initState() {
    super.initState();
    _lang = _getLang(widget.locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageSettings),
      ),
      body: ListView(
        children: [
          RadioListTile(
            value: Lang.en,
            groupValue: _lang,
            onChanged: (lang) {
              setState(() => _lang = lang!);
              ref.read(localeProvider).reset();
            },
            title: const Text('English'),
            tileColor: _tileColor,
            controlAffinity: _controlAffinity,
          ),
          RadioListTile(
            value: Lang.id,
            groupValue: _lang,
            onChanged: (lang) {
              setState(() => _lang = lang!);
              ref.read(localeProvider).setToId();
            },
            title: const Text('Indonesia'),
            tileColor: _tileColor,
            controlAffinity: _controlAffinity,
          ),
        ],
      ),
    );
  }

  Lang _getLang(String locale) {
    switch (locale) {
      case 'en_US':
        return Lang.en;
      case 'id_ID':
        return Lang.id;
      default:
        return Lang.en;
    }
  }
}

class LanguageSettingsArgs {
  LanguageSettingsArgs(this.locale);

  final String locale;
}
