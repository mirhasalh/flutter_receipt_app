import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/provider/item_provider.dart';
import 'package:flutter_receipt_app/src/shared/shared.dart';
import 'package:flutter_receipt_app/src/utils/nav_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ItemPage extends StatefulHookConsumerWidget {
  static const routeName = '/item';

  const ItemPage({super.key, required this.locale, required this.symbol});

  final String locale;
  final String symbol;

  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends ConsumerState<ItemPage> {
  Set<int> selectedIndex = {};

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Item>> items = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allItems),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddItemPage.routeName,
                arguments: AddItemPageArgs(widget.locale, widget.symbol),
              );
            },
            tooltip: AppLocalizations.of(context)!.addItem,
            color: Colors.teal,
            icon: const Icon(Icons.add),
          ),
          Visibility(
            visible: selectedIndex.isEmpty,
            replacement: IconButton(
              tooltip: 'Delete selected data',
              onPressed: () => _onPressedDeleteItems(),
              icon: const Icon(Icons.delete, color: Colors.teal),
            ),
            child: const SizedBox(),
          ),
        ],
      ),
      body: items.when(
        data: (data) {
          if (data.isEmpty) {
            return const NoData();
          }

          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onLongPress: () => _onLongPressedItemList(data[index].id),
              onTap: () => _onTapItemList(data[index].id, data[index]),
              tileColor: selectedIndex.contains(data[index].id)
                  ? Palette.azure
                  : Colors.white,
              title: Text(data[index].name!),
              subtitle: Text(NumberFormat.currency(
                      locale: widget.locale, symbol: widget.symbol)
                  .format(data[index].sellingPrice)),
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

  void _onLongPressedItemList(int index) {
    if (selectedIndex.any((i) => i == index)) {
      return;
    }

    HapticFeedback.lightImpact();

    setState(() {
      selectedIndex.add(index);
    });
  }

  void _onTapItemList(int index, Item item) {
    if (selectedIndex.any((i) => i == index)) {
      setState(() => selectedIndex.remove(index));
      return;
    }

    if (selectedIndex.isNotEmpty) {
      setState(() => selectedIndex.add(index));
      return;
    }

    NavUtils().toItemDetails(context, item);
  }

  void _onPressedDeleteItems() {
    DbUtils().deleteItems(selectedIndex).then((_) {
      setState(() => selectedIndex.clear());
    });
  }
}

class ItemPageArgs {
  ItemPageArgs(this.locale, this.symbol);

  final String locale;
  final String symbol;
}
