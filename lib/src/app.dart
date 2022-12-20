import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/localizations.dart';
import 'package:flutter_receipt_app/src/provider/locale_provider.dart';
import 'package:flutter_receipt_app/src/route.dart';
import 'package:flutter_receipt_app/src/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var locale = ref.watch(localeProvider).locale;

    return MaterialApp(
      title: 'Pepr App',
      theme: kTheme,
      locale: locale,
      localizationsDelegates: kLocalizationsDelegates,
      supportedLocales: kSupportedLocales,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
