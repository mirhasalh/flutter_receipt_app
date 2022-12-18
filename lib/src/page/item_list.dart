import 'package:flutter_receipt_app/src/common.dart';

class ItemList extends StatelessWidget {
  static const routeName = '/item-list';

  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allItems),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context)!.addItem),
          ),
        ],
      ),
    );
  }
}
