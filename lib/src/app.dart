import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/localizations.dart';
import 'package:flutter_receipt_app/src/provider/locale_provider.dart';
import 'package:flutter_receipt_app/src/provider/theme_provider.dart';
import 'package:flutter_receipt_app/src/route.dart';
import 'package:flutter_receipt_app/src/theme/themes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var locale = ref.watch(localeProvider).locale;
    var themeMode = ref.watch(themeProvider).themeMode;

    return MaterialApp(
      title: 'Heibill App',
      theme: kTheme,
      darkTheme: kDarkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: kLocalizationsDelegates,
      supportedLocales: kSupportedLocales,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
