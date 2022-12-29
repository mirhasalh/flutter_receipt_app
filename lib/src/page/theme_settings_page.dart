import 'package:flutter/material.dart';

class ThemeSettingsPage extends StatelessWidget {
  static const routeName = '/themeSettings';

  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme settings'),
      ),
      
    );
  }
}
