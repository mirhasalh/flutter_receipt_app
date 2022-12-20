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

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addItem),
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          _ContainerForColumn(
            children: [
              _buildTitle(context, '1/9 Select an item type'),
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
              Text(
                AppLocalizations.of(context)!.goodsOrServicesCaption,
                style: Theme.of(context).textTheme.caption,
              ),
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
              _buildTitle(context, '2/9 Type the name of the item'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: nameController,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Palette.eerieBlack),
                decoration: const InputDecoration(
                  hintText: 'Pen',
                ),
                keyboardType: TextInputType.name,
                onChanged: (text) => name.value = text,
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
                name.value == '' ? null : () => _nextPage(pageController),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          _ContainerForColumn(
            children: [
              _buildTitle(context, '3/9 Enter a selling price per item'),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: '0',
                ),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Palette.eerieBlack),
                keyboardType: TextInputType.number,
                onChanged: (text) => sellingPrice.value = double.parse(text),
              ),
              const SizedBox(height: 8.0),
              _buildRowOfButton(
                context,
                true,
                () => _prevPage(pageController),
                sellingPrice.value <= 0
                    ? null
                    : () => _nextPage(pageController),
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

  Widget _buildTitle(BuildContext context, String text) => Text(text,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(color: Palette.slateGray));

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
