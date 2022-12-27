import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  static const routeName = '/info';

  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalization'),
      ),
    );
  }
}
