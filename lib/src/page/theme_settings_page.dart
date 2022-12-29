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
      body: ListView.separated(
        itemBuilder: (context, index) {
          final theme = ThemeMode.values[index];
          return ListTile(
            title: Text(
                '${theme.name[0].toUpperCase()}${theme.name.substring(1)}'),
            tileColor: Colors.white,
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0.0),
        itemCount: ThemeMode.values.length,
      ),
    );
  }
}
