import 'package:flutter_receipt_app/src/common.dart';

class SupplierList extends StatelessWidget {
  static const routeName = '/supplier-list';

  const SupplierList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.supplier),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: AppLocalizations.of(context)!.addSupplier,
            color: Colors.teal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
