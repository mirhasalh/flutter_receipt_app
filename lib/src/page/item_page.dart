import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/db/item.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/provider/item_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemPage extends ConsumerWidget {
  static const routeName = '/item';

  const ItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Item>> items = ref.watch(itemProvider);
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
      body: items.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text(
                'No data',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.black54),
              ),
            );
          }

          return ListView.separated(
            // itemBuilder: (context, index) => ListTile(
            //   onTap: () => _onTapSupplierList(data[index].id),
            //   onLongPress: () => _onLongPressedSupplierList(data[index].id),
            //   tileColor: selectedIndex.contains(data[index].id)
            //       ? Palette.azure
            //       : Colors.white,
            //   title: Text(data[index].supplierName!),
            //   trailing: selectedIndex.contains(data[index].id)
            //       ? const Icon(Icons.check_box, color: Colors.teal)
            //       : const SizedBox.shrink(),
            // ),
            itemBuilder: (context, index) => ListTile(
              onTap: () {},
              tileColor: Colors.white,
              title: Text(data[index].name!),
              subtitle: Text('${data[index].sellingPrice}'),
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
}
