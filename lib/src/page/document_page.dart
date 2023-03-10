import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/utils/nav_utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class DocumentPage extends StatelessWidget {
  static const routeName = '/document';

  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recentDocs),
      ),
      floatingActionButton: SpeedDial(
        tooltip: AppLocalizations.of(context)!.openMenu,
        backgroundColor: Palette.naplesYellow,
        foregroundColor: Palette.eerieBlack,
        children: [
          SpeedDialChild(
            onTap: () => Navigator.of(context).pushNamed(AddDocPage.routeName),
            label: AppLocalizations.of(context)!.createNewDoc,
            child: const Icon(Icons.post_add_outlined),
          ),
          SpeedDialChild(
            onTap: () => NavUtils().toItemPage(context),
            label: AppLocalizations.of(context)!.seeAllItems,
            child: const Icon(Icons.inventory_2_outlined),
          ),
          SpeedDialChild(
            onTap: () =>
                Navigator.of(context).pushNamed(SupplierPage.routeName),
            label: AppLocalizations.of(context)!.supplier,
            child: const Icon(Icons.warehouse_outlined),
          ),
          SpeedDialChild(
            onTap: () =>
                Navigator.of(context).pushNamed(SettingsPage.routeName),
            label: AppLocalizations.of(context)!.settings,
            child: const Icon(Icons.settings_outlined),
          ),
        ],
        icon: Icons.expand_less,
        activeIcon: Icons.expand_more,
      ),
    );
  }
}
