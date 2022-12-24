import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/assets/fonts.dart';
import 'package:flutter_receipt_app/src/db/item.dart';
import 'package:flutter_receipt_app/src/palette.dart';

class ItemDetailsPage extends StatefulWidget {
  static const routeName = '/itemsDetails';

  const ItemDetailsPage({super.key, required this.item});

  final Item item;

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
                  title: Text(
                    '${widget.item.name}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Item name',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.sellingPrice}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Selling price',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
              ],
            )
          : ListView(
              children: [
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.name}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Item name',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.sellingPrice}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Selling price',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.stock}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Stock quantity',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.wholesalePrice}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Wholesale price',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.max}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Max',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.min}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Min',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
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
                          'Maximum and minimum purchases at wholesale prices',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Palette.goldFusion,
                                fontFamily: Fonts.courierPrime,
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
                  title: Text(
                    '${widget.item.supplierName}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Supplier',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
                const Divider(height: 0.0),
                ListTile(
                  onTap: () {},
                  style: ListTileStyle.list,
                  tileColor: Colors.white,
                  title: Text(
                    '${widget.item.initialPrice}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                  subtitle: Text(
                    'Initial price',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black54,
                          fontFamily: Fonts.courierPrime,
                        ),
                  ),
                ),
              ],
            ),
    );
  }
}

class ItemDetailsArgs {
  ItemDetailsArgs(this.item);

  final Item item;
}
