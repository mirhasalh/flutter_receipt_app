import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/constant/sizes.dart';
import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/provider/suppliers_provider.dart';
import 'package:flutter_receipt_app/src/shared/shared.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SupplierPage extends ConsumerStatefulWidget {
  static const routeName = '/supplier';

  const SupplierPage({super.key});

  @override
  SupplierListState createState() => SupplierListState();
}

class SupplierListState extends ConsumerState<SupplierPage> {
  final supplierNameController = TextEditingController();
  Set<int> selectedIndex = {};

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Supplier>> suppliers = ref.watch(suppliersProvider);

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
          Visibility(
            visible: selectedIndex.isEmpty,
            replacement: IconButton(
              onPressed: () => _onPressedDelete(),
              icon: const Icon(Icons.delete, color: Colors.teal),
            ),
            child: const SizedBox.shrink(),
          ),
        ],
      ),
      body: suppliers.when(
        data: (data) {
          if (data.isEmpty) {
            return _buildEmptySupplier();
          }

          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onTap: () => _onTapSupplierList(data[index].id),
              onLongPress: () => _onLongPressedSupplierList(data[index].id),
              tileColor: selectedIndex.contains(data[index].id)
                  ? Palette.azure
                  : Colors.white,
              title: Text(data[index].supplierName!),
              trailing: selectedIndex.contains(data[index].id)
                  ? const Icon(Icons.check_box, color: Colors.teal)
                  : const SizedBox.shrink(),
            ),
            separatorBuilder: (context, index) => const Divider(height: 0.0),
            itemCount: data.length,
          );
        },
        error: (error, stackTrace) =>
            const Center(child: Text('Failed to load')),
        loading: () => const Center(child: CircularProgressIndicator()),
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
          top: kBottomSheetRadius,
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
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    const SizedBox(width: 8.0),
                    TextButton(
                      onPressed: supplierNameController.text.isEmpty
                          ? null
                          : () => _onAddSupplier(supplierNameController.text),
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

  void _onAddSupplier(String name) {
    var supplier = Supplier()..supplierName = name.trim();

    DbUtils().addSupplier(supplier);

    Navigator.of(context).pop();
  }

  Widget _buildEmptySupplier() => Center(
        child: Text(
          'No data',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.black54),
        ),
      );

  void _onLongPressedSupplierList(int index) {
    if (selectedIndex.any((i) => i == index)) {
      return;
    }

    HapticFeedback.lightImpact();

    setState(() {
      selectedIndex.add(index);
    });
  }

  void _onTapSupplierList(int index) {
    if (selectedIndex.any((i) => i == index)) {
      setState(() => selectedIndex.remove(index));
      return;
    }

    if (selectedIndex.isNotEmpty) {
      setState(() => selectedIndex.add(index));
    }
  }

  void _onPressedDelete() {
    DbUtils()
        .deleteSuppliers(selectedIndex)
        .then((_) => setState(() => selectedIndex.clear()));
  }
}
