import 'package:flutter/material.dart';

class AddDocPage extends StatelessWidget {
  static const routeName = '/addDoc';

  const AddDocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New document'),
      ),
    );
  }
}
