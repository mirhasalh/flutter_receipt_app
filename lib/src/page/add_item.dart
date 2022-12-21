import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/constant/duration.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/utils/add_item_utils.dart';

class AddItem extends HookWidget {
  static const routeName = '/add-item';

  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
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
    final sellingPrice = useState<double>(0);
    final stock = useState<int>(0);
    final wholesalePrice = useState<double>(0);
    final max = useState<int>(0);
    final min = useState<int>(0);
    final supplierName = useState<String>('');
    final initialPrice = useState<double>(0);
    final focus = useState<bool>(false);

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
              _buildTitle(context, '1/7 Select an item type'),
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
              _buildTitle(context, '2/7 Type the name of the item'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: nameController,
                style: _getTextFieldStyle(context),
                decoration: const InputDecoration(
                  hintText: 'Pen',
                ),
                keyboardType: TextInputType.name,
                onTap: () => focus.value = true,
                onChanged: (text) => name.value = text,
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
                name.value == ''
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
              _buildTitle(context, '3/7 Enter a selling price per item'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: '0',
                ),
                style: _getTextFieldStyle(context),
                keyboardType: TextInputType.number,
                onTap: () => focus.value = true,
                onChanged: (text) => sellingPrice.value = double.parse(text),
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
                sellingPrice.value <= 0
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
              _buildTitle(context, '4/7 Enter stock quantity'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: stockController,
                decoration: const InputDecoration(
                  hintText: '0',
                ),
                style: _getTextFieldStyle(context),
                keyboardType: TextInputType.number,
                onTap: () => focus.value = true,
                onChanged: (text) => stock.value = int.parse(text),
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
                stock.value <= 0
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
              _buildTitle(context, '5/7 Enter wholesale price details'),
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
                onChanged: (text) => wholesalePrice.value = double.parse(text),
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
                      onChanged: (text) => max.value = int.parse(text),
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
                      onChanged: (text) => min.value = int.parse(text),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              _buildCaption(
                  context, AppLocalizations.of(context)!.wholesalePriceCaption),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
                wholesalePrice.value <= 0 && max.value <= 0 && min.value <= 0
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
              _buildTitle(context, '6/7 Enter supplier name and initial price'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: supplierNameController,
                decoration: const InputDecoration(
                  hintText: 'Father Grocery Store',
                  labelText: 'Name (Optional)',
                ),
                style: _getTextFieldStyle(context),
                keyboardType: TextInputType.name,
                onTap: () => focus.value = true,
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
                onChanged: (text) => initialPrice.value = double.parse(text),
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
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
              _buildTitle(context, '7/7 Review new item'),
              const SizedBox(height: 8.0),
              Text(name.value),
              Text('${sellingPrice.value}'),
              Text('${stock.value}'),
              Text('${wholesalePrice.value}'),
              Text('${max.value}'),
              Text('${min.value}'),
              Text(supplierName.value),
              Text('${initialPrice.value}'),
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

  TextStyle _getTitleTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.subtitle2!.copyWith(color: Palette.slateGray);

  TextStyle _getTextFieldStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: Palette.eerieBlack);

  Text _buildCaption(BuildContext context, String caption) =>
      Text(caption, style: Theme.of(context).textTheme.caption);
}

class _ContainerForColumn extends StatelessWidget {
  const _ContainerForColumn({this.children = const <Widget>[]});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
