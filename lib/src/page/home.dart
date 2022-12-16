import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casheet App'),
      ),
      floatingActionButton: SpeedDial(
        tooltip: 'Menu',
        children: [
          SpeedDialChild(
            onTap: () {},
            label: 'Add item',
            child: const Icon(Icons.add),
          ),
          SpeedDialChild(
            onTap: () {},
            label: 'Items',
            child: const Icon(Icons.interests_outlined),
          ),
          SpeedDialChild(
            onTap: () {
              Navigator.of(context).pushNamed(Settings.routeName);
            },
            label: 'Settings',
            child: const Icon(Icons.settings_outlined),
          ),
        ],
        animatedIcon: AnimatedIcons.menu_close,
      ),
    );
  }
}
