import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/routers.dart';
import 'package:flutter_receipt_app/src/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casheet App',
      theme: AppTheme().data,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: '/',
    );
  }
}
