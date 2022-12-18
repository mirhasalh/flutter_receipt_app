import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recentDocs),
      ),
      floatingActionButton: SpeedDial(
        tooltip: AppLocalizations.of(context)!.openMenu,
        children: [
          SpeedDialChild(
            onTap: () {},
            label: AppLocalizations.of(context)!.createNewDoc,
            child: const Icon(Icons.add),
          ),
          SpeedDialChild(
            onTap: () {
              Navigator.of(context).pushNamed(ItemList.routeName);
            },
            label: AppLocalizations.of(context)!.seeAllItems,
            child: const Icon(Icons.all_inbox_outlined),
          ),
          SpeedDialChild(
            onTap: () {
              Navigator.of(context).pushNamed(Settings.routeName);
            },
            label: AppLocalizations.of(context)!.settings,
            child: const Icon(Icons.settings_outlined),
          ),
        ],
        icon: Icons.add,
        activeIcon: Icons.close,
      ),
    );
  }
}
