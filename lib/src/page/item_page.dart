import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';

class ItemPage extends StatelessWidget {
  static const routeName = '/item';

  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allItems),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddItemPage.routeName);
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
