import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/shared/shared.dart';

class SupplierList extends StatefulWidget {
  static const routeName = '/supplier-list';

  const SupplierList({super.key});

  @override
  State<SupplierList> createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList> {
  final supplierNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.supplier),
        actions: [
          IconButton(
            onPressed: () => _openAddSupplierBottomSheet(),
            tooltip: AppLocalizations.of(context)!.addSupplier,
            color: Colors.teal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _openAddSupplierBottomSheet() {
    setState(() {
      supplierNameController.clear();
    });

    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => FractionallySizedBox(
          heightFactor: 0.85,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DragHandle(),
                const SizedBox(height: 18.0),
                Text(
                  AppLocalizations.of(context)!.typeSupplierName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Palette.slateGray),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: supplierNameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.name,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          supplierNameController.clear();
                        });

                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: supplierNameController.text.isEmpty
                          ? null
                          : () {
                              setState(() {
                                supplierNameController.clear();
                              });

                              Navigator.of(context).pop();
                            },
                      child: Text(AppLocalizations.of(context)!.addSupplier),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
