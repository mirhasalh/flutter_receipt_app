import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/db/item.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/utils/string_format.dart';

class ItemDetailsPage extends StatefulWidget {
  static const routeName = '/itemsDetails';

  const ItemDetailsPage({super.key, required this.item, required this.locale});

  final Item item;
  final String locale;

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  bool _editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item details'),
        actions: [
          Visibility(
            visible: _editMode,
            replacement: IconButton(
              tooltip: 'Edit mode',
              onPressed: () {
                setState(() {
                  _editMode = true;
                });
              },
              icon: const Icon(Icons.edit, color: Colors.teal),
            ),
            child: IconButton(
              tooltip: 'Save changes',
              onPressed: () {
                setState(() {
                  _editMode = false;
                });
              },
              icon: const Icon(Icons.check, color: Colors.teal),
            ),
          ),
        ],
      ),
      body: widget.item.type == 2
          ? ListView(
              children: [
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text('${widget.item.name}'),
                  subtitle: const Text('Item name'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    StringFormat()
                        .currency(widget.locale, '${widget.item.sellingPrice}'),
                  ),
                  subtitle: const Text('Selling price'),
                ),
              ],
            )
          : ListView(
              children: [
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text('${widget.item.name}'),
                  subtitle: const Text('Item name'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(StringFormat()
                      .currency(widget.locale, '${widget.item.sellingPrice}')),
                  subtitle: const Text('Selling price'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text('${widget.item.stock}'),
                  subtitle: const Text('Stock quantity'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(StringFormat().currency(
                      widget.locale, '${widget.item.wholesalePrice}')),
                  subtitle: const Text('Wholesale price'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text('${widget.item.max}'),
                  subtitle: const Text('Max'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text('${widget.item.min}'),
                  subtitle: const Text('Min'),
                ),
                const Divider(height: 0.0),
                Container(
                  height: kToolbarHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: Palette.floralWhite,
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Palette.goldFusion),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          'Maximum and minimum purchases at wholesale price',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Palette.goldFusion,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text('${widget.item.supplierName}'),
                  subtitle: const Text('Supplier'),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(StringFormat()
                      .currency(widget.locale, '${widget.item.initialPrice}')),
                  subtitle: const Text('Initial price'),
                ),
              ],
            ),
    );
  }
}

class ItemDetailsArgs {
  ItemDetailsArgs(this.item, this.locale);

  final Item item;
  final String locale;
}
