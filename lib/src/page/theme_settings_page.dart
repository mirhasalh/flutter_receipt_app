import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/provider/theme_provider.dart';
import 'package:flutter_receipt_app/src/utils/theme_settings_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeSettingsPage extends ConsumerWidget {
  static const routeName = '/themeSettings';

  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider).themeMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme settings'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final theme = ThemeMode.values[index];
          return RadioListTile(
            value: theme,
            groupValue: themeMode,
            onChanged: (theme) {
              ref.read(themeProvider).setTheme(theme!);

              ThemeSettingsUtils().setSystemNavigationBarColor(
                context: context,
                themeMode: theme,
              );
            },
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
                '${theme.name[0].toUpperCase()}${theme.name.substring(1)}'),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0.0),
        itemCount: ThemeMode.values.length,
      ),
    );
  }
}
