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
      body: ListView(
        children: [
          RadioListTile(
            value: Locales.en,
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
            value: Locales.id,
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
}

class LanguageSettingsArgs {
  LanguageSettingsArgs(this.locale);

  final String locale;
}
