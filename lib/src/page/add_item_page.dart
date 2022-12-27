import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_receipt_app/src/assets/fonts.dart';
import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/constant/duration.dart';
import 'package:flutter_receipt_app/src/constant/sizes.dart';
import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/provider/suppliers_provider.dart';
import 'package:flutter_receipt_app/src/shared/drag_handle.dart';
import 'package:flutter_receipt_app/src/utils/add_item_utils.dart';
import 'package:flutter_receipt_app/src/utils/snack_bar_utils.dart';
import 'package:flutter_receipt_app/src/utils/string_format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddItemPage extends StatefulHookConsumerWidget {
  static const routeName = '/addItem';

  const AddItemPage({super.key, required this.locale, required this.symbol});

  final String locale;
  final String symbol;

  @override
  AddItemPageState createState() => AddItemPageState();
}

class AddItemPageState extends ConsumerState<AddItemPage> {
  var supplierNameController = TextEditingController();
  String supplierName = '';

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final nameController = useTextEditingController();
    final priceController = useTextEditingController();
    final stockController = useTextEditingController();
    final wholesalePriceController = useTextEditingController();
    final maxController = useTextEditingController();
    final minController = useTextEditingController();
    final initialPriceController = useTextEditingController();
    final itemType = useState<ItemType>(ItemType.none);
    final type = useState<int>(0);
    final name = useState<String>('');
    final sellingPrice = useState<String>('');
    final stock = useState<String>('');
    final wholesalePrice = useState<String>('');
    final max = useState<String>('');
    final min = useState<String>('');
    final initialPrice = useState<String>('');
    final focus = useState<bool>(false);
    AsyncValue<List<Supplier>> suppliers = ref.watch(suppliersProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addItem),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          _ContainerForColumn(
            children: [
              if (itemType.value == ItemType.none)
                _buildTitle('Select an item type'),
              if (itemType.value == ItemType.goods)
                _buildTitle('1/6 Select an item type'),
              if (itemType.value == ItemType.services)
                _buildTitle('1/4 Select an item type'),
              const SizedBox(height: 8.0),
              RadioListTile<ItemType>(
                value: ItemType.goods,
                groupValue: itemType.value,
                onChanged: (value) {
                  itemType.value = value!;
                  type.value = AddItemUtils().getType(value);
                },
                title: const Text('Goods'),
              ),
              RadioListTile<ItemType>(
                value: ItemType.services,
                groupValue: itemType.value,
                onChanged: (value) {
                  itemType.value = value!;
                  type.value = AddItemUtils().getType(value);
                },
                title: const Text('Services'),
              ),
              const SizedBox(height: 8.0),
              _buildCaption(
                  AppLocalizations.of(context)!.goodsOrServicesCaption),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                false,
                null,
                itemType.value == ItemType.none
                    ? null
                    : () => _nextPage(pageController),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          _ContainerForColumn(
            children: [
              if (itemType.value == ItemType.goods)
                _buildTitle('2/6 Type the item name and stock quantity'),
              if (itemType.value == ItemType.services)
                _buildTitle('2/4 Type the item name'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: nameController,
                style: _getTextFieldStyle(),
                decoration: InputDecoration(
                  labelText: 'Item name',
                  hintText: itemType.value == ItemType.goods
                      ? 'Blue T-Shirt'
                      : 'Laundry 3kg',
                ),
                keyboardType: TextInputType.name,
                onTap: () => focus.value = true,
                onChanged: (text) => name.value = text,
              ),
              const SizedBox(height: 8.0),
              Visibility(
                visible: itemType.value == ItemType.goods,
                replacement: const SizedBox.shrink(),
                child: TextFormField(
                  controller: stockController,
                  decoration: const InputDecoration(
                    labelText: 'Stock quantity',
                    hintText: '0',
                  ),
                  style: _getTextFieldStyle(),
                  keyboardType: TextInputType.number,
                  onTap: () => focus.value = true,
                  onChanged: (text) => stock.value = text,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                true,
                () {
                  if (focus.value == true) {
                    FocusScope.of(context).unfocus();
                    focus.value = false;
                    return;
                  }

                  _prevPage(pageController);
                },
                itemType.value == ItemType.services
                    ? name.value == ''
                        ? null
                        : () {
                            if (focus.value == true) {
                              FocusScope.of(context).unfocus();
                              focus.value = false;
                              return;
                            }

                            _nextPage(pageController);
                          }
                    : name.value == '' ||
                            stock.value == '0' ||
                            stock.value == ''
                        ? null
                        : () {
                            if (focus.value == true) {
                              FocusScope.of(context).unfocus();
                              focus.value = false;
                              return;
                            }

                            _nextPage(pageController);
                          },
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          _ContainerForColumn(
            children: [
              if (itemType.value == ItemType.goods)
                _buildTitle('3/6 Enter a selling price per item'),
              if (itemType.value == ItemType.services)
                _buildTitle('3/4 Enter a selling price per item'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: '0',
                  prefix: Text(widget.symbol),
                ),
                style: _getTextFieldStyle(),
                keyboardType: TextInputType.number,
                onTap: () => focus.value = true,
                onChanged: (text) => sellingPrice.value = text,
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                true,
                () {
                  if (focus.value == true) {
                    FocusScope.of(context).unfocus();
                    focus.value = false;
                    return;
                  }

                  _prevPage(pageController);
                },
                sellingPrice.value == '0' || sellingPrice.value == ''
                    ? null
                    : () {
                        if (focus.value == true) {
                          FocusScope.of(context).unfocus();
                          focus.value = false;
                          return;
                        }

                        _nextPage(pageController);
                      },
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          if (itemType.value == ItemType.goods)
            _ContainerForColumn(
              children: [
                _buildTitle('4/6 Enter wholesale price details'),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: wholesalePriceController,
                  decoration: InputDecoration(
                    prefix: Text(widget.symbol),
                    hintText: '0',
                    labelText: 'Wholesale price',
                  ),
                  style: _getTextFieldStyle(),
                  keyboardType: TextInputType.number,
                  onTap: () => focus.value = true,
                  onChanged: (text) => wholesalePrice.value = text,
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: maxController,
                        style: _getTextFieldStyle(),
                        decoration: const InputDecoration(
                          labelText: 'Max',
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        onTap: () => focus.value = true,
                        onChanged: (text) => max.value = text,
                      ),
                    ),
                    const SizedBox(width: 18.0),
                    Flexible(
                      child: TextFormField(
                        controller: minController,
                        style: _getTextFieldStyle(),
                        decoration: const InputDecoration(
                          labelText: 'Min',
                          hintText: '0',
                        ),
                        keyboardType: TextInputType.number,
                        onTap: () => focus.value = true,
                        onChanged: (text) => min.value = text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                _buildCaption(
                    AppLocalizations.of(context)!.wholesalePriceCaption),
                const SizedBox(height: 8.0),
                _buildRowOfButton(
                  true,
                  () {
                    if (focus.value == true) {
                      FocusScope.of(context).unfocus();
                      focus.value = false;
                      return;
                    }

                    _prevPage(pageController);
                  },
                  wholesalePrice.value == '0' ||
                          wholesalePrice.value == '' ||
                          max.value == '0' ||
                          max.value == '' ||
                          min.value == '0' ||
                          min.value == ''
                      ? null
                      : () {
                          if (focus.value == true) {
                            FocusScope.of(context).unfocus();
                            focus.value = false;
                            return;
                          }

                          _nextPage(pageController);
                        },
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          if (itemType.value == ItemType.goods)
            _ContainerForColumn(
              children: [
                _buildTitle('5/6 Enter supplier name and initial price'),
                const SizedBox(height: 8.0),
                // TextFormField(
                //   controller: supplierNameController,
                //   decoration: const InputDecoration(
                //     hintText: 'Father Grocery Store',
                //     labelText: 'Name (Optional)',
                //   ),
                //   style: _getTextFieldStyle(),
                //   keyboardType: TextInputType.name,
                //   onChanged: (text) => supplierName.value = text,
                //   onTap: () => _showSupplierBottomSheet(
                //     suppliers,
                //     (text) => supplierNameController.text = text,
                //   ),
                // ),
                TextField(
                  readOnly: true,
                  controller: supplierNameController,
                  decoration: const InputDecoration(
                    helperText: 'Father Grocery Store',
                    labelText: 'Supplier name (Optional)',
                  ),
                  style: _getTextFieldStyle(),
                  onTap: () => _showSupplierBottomSheet(suppliers),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: initialPriceController,
                  decoration: InputDecoration(
                    prefix: Text(widget.symbol),
                    labelText: 'Initial price (Optional)',
                    hintText: '0',
                  ),
                  style: _getTextFieldStyle(),
                  keyboardType: TextInputType.number,
                  onTap: () => focus.value = true,
                  onChanged: (text) => initialPrice.value = text,
                ),
                const SizedBox(height: 8.0),
                _buildRowOfButton(
                  true,
                  () {
                    if (focus.value == true) {
                      FocusScope.of(context).unfocus();
                      focus.value = false;
                      return;
                    }

                    _prevPage(pageController);
                  },
                  () {
                    if (focus.value == true) {
                      FocusScope.of(context).unfocus();
                      focus.value = false;
                      return;
                    }

                    _nextPage(pageController);
                  },
                ),
                const SizedBox(height: 8.0),
                _buildCaption(
                    'You can manage the supplier list through the supplier page which is available in the menu on the first page of the app'),
                const SizedBox(height: 8.0),
              ],
            ),
          _ContainerForColumn(
            children: [
              if (itemType.value == ItemType.goods)
                _buildTitle('6/6 Review new item'),
              if (itemType.value == ItemType.services)
                _buildTitle('4/4 Review new item'),
              const SizedBox(height: 8.0),
              _ContainerForReview(
                title: name.value,
                titleTextStyle:
                    Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.eerieBlack,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.courierPrime,
                        ),
                subtitleTextStyle:
                    Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: Fonts.courierPrime,
                        ),
                valueTextStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Palette.eerieBlack,
                      fontFamily: Fonts.courierPrime,
                    ),
                sellingPrice: StringFormat().currency(
                  widget.locale,
                  sellingPrice.value,
                ),
                stock: stock.value,
                wholesalePrice: StringFormat().currency(
                  widget.locale,
                  wholesalePrice.value,
                ),
                max: max.value,
                min: min.value,
                supplierName: supplierName,
                initialPrice: StringFormat().currency(
                  widget.locale,
                  initialPrice.value,
                ),
                itemType: itemType.value,
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButtonForAdd(
                () => _prevPage(pageController),
                () {
                  var item = Item();

                  item.type = AddItemUtils().getType(itemType.value);
                  item.name = name.value.trim();
                  item.sellingPrice = sellingPrice.value == ''
                      ? 0
                      : double.parse(sellingPrice.value);
                  item.stock = stock.value == '' ? 0 : int.parse(stock.value);
                  item.wholesalePrice = wholesalePrice.value == ''
                      ? 0
                      : double.parse(wholesalePrice.value);
                  item.max = max.value == '' ? 0 : int.parse(max.value);
                  item.min = min.value == '' ? 0 : int.parse(min.value);
                  item.supplierName = supplierName == '' ? 'n/a' : supplierName;
                  item.initialPrice = initialPrice.value == ''
                      ? 0
                      : double.parse(initialPrice.value);

                  DbUtils().addItem(
                    item,
                    (_) => SnackBarUtils()
                        .text(context, 'Item name must be unique'),
                  );

                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ],
      ),
    );
  }

  void _nextPage(PageController pageController) {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: kPageTransition,
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage(PageController pageController) {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: kPageTransition,
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildTitle(String text) => Text(text, style: _getTitleTextStyle());

  Widget _buildRowOfButton(
    bool enablePrev,
    VoidCallback? onPressedPrev,
    VoidCallback? onPressedNext,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: enablePrev,
            replacement: const SizedBox.shrink(),
            child: TextButton(
              onPressed: onPressedPrev,
              child: const Text('Previous'),
            ),
          ),
          TextButton(
            onPressed: onPressedNext,
            child: const Text('Next'),
          ),
        ],
      );
  Widget _buildRowOfButtonForAdd(
    VoidCallback? onPressedPrev,
    VoidCallback? onPressedAdd,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onPressedPrev,
            child: const Text('Previous'),
          ),
          TextButton(
            onPressed: onPressedAdd,
            child: Text(AppLocalizations.of(context)!.addItem),
          ),
        ],
      );

  TextStyle _getTitleTextStyle() =>
      Theme.of(context).textTheme.subtitle2!.copyWith(color: Palette.slateGray);

  TextStyle _getTextFieldStyle() => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: Palette.eerieBlack, fontFamily: Fonts.courierPrime);

  Text _buildCaption(String caption) =>
      Text(caption, style: Theme.of(context).textTheme.caption);

  void _showSupplierBottomSheet(AsyncValue<List<Supplier>> streamSupplier) =>
      showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: kBottomSheetRadius),
        ),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 1.0,
          builder: (_, scrollController) => Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: kBottomSheetRadius),
            ),
            child: Column(
              children: [
                const DragHandle(),
                streamSupplier.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height / 4.5),
                              child: Text(
                                'No data',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.only(top: 12.0),
                        itemBuilder: (context, index) => SizedBox(
                          height: kToolbarHeight,
                          child: RawMaterialButton(
                            constraints: const BoxConstraints(
                              minHeight: 0.0,
                              minWidth: 0.0,
                            ),
                            onPressed: () {
                              setState(() {
                                supplierNameController.text =
                                    data[index].supplierName!;
                                supplierName = data[index].supplierName!;
                              });

                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 16.0),
                                Text(
                                  data[index].supplierName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: Palette.eerieBlack,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const Divider(height: 0.0),
                        itemCount: data.length,
                      ),
                    );
                  },
                  error: (error, stackTrace) => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      );
}

class AddItemPageArgs {
  AddItemPageArgs(this.locale, this.symbol);

  final String locale;
  final String symbol;
}

class _ContainerForColumn extends StatelessWidget {
  const _ContainerForColumn({this.children = const <Widget>[]});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height > 360.0
              ? kToolbarHeight
              : 18.0,
          left: 18.0,
          right: 18.0,
          bottom: 18.0,
        ),
        children: children,
      ),
    );
  }
}

class _ContainerForReview extends StatelessWidget {
  const _ContainerForReview({
    required this.title,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.valueTextStyle,
    required this.itemType,
    required this.sellingPrice,
    required this.stock,
    required this.wholesalePrice,
    required this.max,
    required this.min,
    required this.supplierName,
    required this.initialPrice,
  });

  final String title;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle valueTextStyle;
  final ItemType itemType;
  final String sellingPrice;
  final String stock;
  final String wholesalePrice;
  final String max;
  final String min;
  final String supplierName;
  final String initialPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: Palette.cultured,
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: titleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          ListTile(
            subtitle: Text('Selling price', style: subtitleTextStyle),
            title: Text(sellingPrice, style: valueTextStyle),
          ),
          ListTile(
            title: Text(
              itemType == ItemType.services ? 'n/a' : stock,
              style: itemType == ItemType.services
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black26)
                  : valueTextStyle,
            ),
            subtitle: Text('Stock quantity', style: subtitleTextStyle),
          ),
          const Divider(),
          ListTile(
            subtitle: Text('Wholesale price', style: subtitleTextStyle),
            title: Text(
              itemType == ItemType.services ? 'n/a' : wholesalePrice,
              style: itemType == ItemType.services
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black26)
                  : valueTextStyle,
            ),
          ),
          ListTile(
            subtitle: Text('Max', style: subtitleTextStyle),
            title: Text(
              itemType == ItemType.services ? 'n/a' : max,
              style: itemType == ItemType.services
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black26)
                  : valueTextStyle,
            ),
          ),
          ListTile(
            subtitle: Text('Min', style: subtitleTextStyle),
            title: Text(
              itemType == ItemType.services ? 'n/a' : min,
              style: itemType == ItemType.services
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black26)
                  : valueTextStyle,
            ),
          ),
          const Divider(),
          ListTile(
            subtitle: Text('Supplier name', style: subtitleTextStyle),
            title: Text(
              itemType == ItemType.goods
                  ? supplierName == ''
                      ? 'n/a'
                      : supplierName
                  : 'n/a',
              style: itemType == ItemType.services
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black26)
                  : valueTextStyle,
            ),
          ),
          ListTile(
            subtitle: Text('Initial price', style: subtitleTextStyle),
            title: Text(
              itemType == ItemType.goods
                  ? initialPrice == ''
                      ? 'n/a'
                      : initialPrice
                  : 'n/a',
              style: itemType == ItemType.services
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black26)
                  : valueTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

// class CurrencyInputFormat extends TextInputFormatter {
//   var localeAndSymbol = LocaleUtils().localeAndSymbol;

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     late int index;

//     index = PrefsUtils().getLocaleForCurrencyIndex() as int;

//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     double value = double.parse(newValue.text);

//     final formatter =
//         NumberFormat.simpleCurrency(locale: localeAndSymbol[index]['locale']);

//     String newText = formatter.format(value / 100);

//     return newValue.copyWith(
//       text: newText,
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }
