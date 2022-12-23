import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/constant/duration.dart';
import 'package:flutter_receipt_app/src/constant/sizes.dart';
import 'package:flutter_receipt_app/src/db/supplier.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/provider/suppliers_provider.dart';
import 'package:flutter_receipt_app/src/utils/add_item_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddItemPage extends HookConsumerWidget {
  static const routeName = '/addItem';

  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final nameController = useTextEditingController();
    final priceController = useTextEditingController();
    final stockController = useTextEditingController();
    final wholesalePriceController = useTextEditingController();
    final maxController = useTextEditingController();
    final minController = useTextEditingController();
    final supplierNameController = useTextEditingController();
    final initialPriceController = useTextEditingController();
    final itemType = useState<ItemType>(ItemType.none);
    final type = useState<int>(0);
    final name = useState<String>('');
    final sellingPrice = useState<String>('');
    final stock = useState<String>('');
    final wholesalePrice = useState<String>('');
    final max = useState<String>('');
    final min = useState<String>('');
    final supplierName = useState<String>('');
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
                _buildTitle(context, 'Select an item type'),
              if (itemType.value == ItemType.goods)
                _buildTitle(context, '1/6 Select an item type'),
              if (itemType.value == ItemType.services)
                _buildTitle(context, '1/4 Select an item type'),
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
              _buildCaption(context,
                  AppLocalizations.of(context)!.goodsOrServicesCaption),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
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
                _buildTitle(
                    context, '2/6 Type the item name and stock quantity'),
              if (itemType.value == ItemType.services)
                _buildTitle(context, '2/4 Type the item name'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: nameController,
                style: _getTextFieldStyle(context),
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
                  style: _getTextFieldStyle(context),
                  keyboardType: TextInputType.number,
                  onTap: () => focus.value = true,
                  onChanged: (text) => stock.value = text,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
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
                _buildTitle(context, '3/6 Enter a selling price per item'),
              if (itemType.value == ItemType.services)
                _buildTitle(context, '3/4 Enter a selling price per item'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: '0',
                ),
                style: _getTextFieldStyle(context),
                keyboardType: TextInputType.number,
                onTap: () => focus.value = true,
                onChanged: (text) => sellingPrice.value = text,
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
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
                _buildTitle(context, '4/6 Enter wholesale price details'),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: wholesalePriceController,
                  decoration: const InputDecoration(
                    hintText: '0',
                    labelText: 'Wholesale price',
                  ),
                  style: _getTextFieldStyle(context),
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
                        style: _getTextFieldStyle(context),
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
                        style: _getTextFieldStyle(context),
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
                _buildCaption(context,
                    AppLocalizations.of(context)!.wholesalePriceCaption),
                const SizedBox(height: 8.0),
                _buildRowOfButton(
                  context,
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
                _buildTitle(
                    context, '5/6 Enter supplier name and initial price'),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: supplierNameController,
                  decoration: const InputDecoration(
                    hintText: 'Father Grocery Store',
                    labelText: 'Name (Optional)',
                  ),
                  style: _getTextFieldStyle(context),
                  keyboardType: TextInputType.name,
                  onTap: () {
                    focus.value = true;
                    _showSupplierList(
                      context,
                      suppliers,
                      (value) {},
                    );
                  },
                  onChanged: (text) => supplierName.value = text,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: initialPriceController,
                  decoration: const InputDecoration(
                    labelText: 'Initial price (Optional)',
                    hintText: '0',
                  ),
                  style: _getTextFieldStyle(context),
                  keyboardType: TextInputType.number,
                  onTap: () => focus.value = true,
                  onChanged: (text) => initialPrice.value = text,
                ),
                const SizedBox(height: 8.0),
                _buildRowOfButton(
                  context,
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
              ],
            ),
          _ContainerForColumn(
            children: [
              if (itemType.value == ItemType.goods)
                _buildTitle(context, '6/6 Review new item'),
              if (itemType.value == ItemType.services)
                _buildTitle(context, '4/4 Review new item'),
              const SizedBox(height: 8.0),
              _ContainerForReview(
                title: name.value,
                titleTextStyle:
                    Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Palette.slateGray,
                          fontWeight: FontWeight.bold,
                        ),
                subtitleTextStyle: Theme.of(context).textTheme.caption!,
                valueTextStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Palette.eerieBlack,
                    ),
                sellingPrice: sellingPrice.value,
                stock: stock.value,
                wholesalePrice: wholesalePrice.value,
                max: max.value,
                min: min.value,
                supplierName: supplierName.value,
                initialPrice: initialPrice.value,
                itemType: itemType.value,
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButtonForAdd(
                context,
                () => _prevPage(pageController),
                null,
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

  Widget _buildTitle(BuildContext context, String text) =>
      Text(text, style: _getTitleTextStyle(context));

  Widget _buildRowOfButton(
    BuildContext context,
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
    BuildContext context,
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

  TextStyle _getTitleTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.subtitle2!.copyWith(color: Palette.slateGray);

  TextStyle _getTextFieldStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: Palette.eerieBlack);

  Text _buildCaption(BuildContext context, String caption) =>
      Text(caption, style: Theme.of(context).textTheme.caption);

  void _showSupplierList(
    BuildContext context,
    AsyncValue<List<Supplier>> stream,
    Function(String) onChanged,
  ) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(kBottomSheetBorderRadius),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 1.0,
        builder: (context, scrollController) => stream.when(
          data: (data) {
            if (data.isEmpty) {
              return const Text('No data');
            }

            return ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) => ListTile(
                onTap: onChanged(data[index].supplierName!),
                tileColor: Colors.white,
              ),
              separatorBuilder: (context, index) => const Divider(height: 0.0),
              itemCount: data.length,
            );
          },
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
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
      padding: const EdgeInsets.symmetric(
        vertical: 28.0,
        horizontal: 18.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selling price',
                style: subtitleTextStyle,
              ),
              Text(
                sellingPrice,
                style: valueTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stock quantity',
                style: subtitleTextStyle,
              ),
              Text(
                itemType == ItemType.services ? 'n/a' : stock,
                style: itemType == ItemType.services
                    ? Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black26)
                    : valueTextStyle,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wholesale price',
                style: subtitleTextStyle,
              ),
              Text(
                itemType == ItemType.services ? 'n/a' : wholesalePrice,
                style: itemType == ItemType.services
                    ? Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black26)
                    : valueTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Max',
                style: subtitleTextStyle,
              ),
              Text(
                itemType == ItemType.services ? 'n/a' : max,
                style: itemType == ItemType.services
                    ? Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black26)
                    : valueTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Min',
                style: subtitleTextStyle,
              ),
              Text(
                itemType == ItemType.services ? 'n/a' : min,
                style: itemType == ItemType.services
                    ? Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black26)
                    : valueTextStyle,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Supplier name',
                style: subtitleTextStyle,
              ),
              Text(
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Initial price',
                style: subtitleTextStyle,
              ),
              Text(
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
            ],
          ),
        ],
      ),
    );
  }
}
