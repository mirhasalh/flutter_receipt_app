import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';

class ItemList extends StatelessWidget {
  static const routeName = '/item-list';

  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allItems),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddItem.routeName);
            },
            tooltip: AppLocalizations.of(context)!.addItem,
            color: Colors.teal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
