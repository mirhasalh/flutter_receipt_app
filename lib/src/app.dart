import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/localizations.dart';
import 'package:flutter_receipt_app/src/router.dart';
import 'package:flutter_receipt_app/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casheet App',
      theme: kTheme,
      localizationsDelegates: kLocalizationsDelegates,
      supportedLocales: kSupportedLocales,
      onGenerateRoute: router,
      initialRoute: '/',
    );
  }
}
