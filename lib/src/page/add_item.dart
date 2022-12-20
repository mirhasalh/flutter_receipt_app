import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_receipt_app/src/common.dart';
import 'package:flutter_receipt_app/src/constant/duration.dart';
import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/utils/add_item_utils.dart';

class AddItem extends HookWidget {
  static const routeName = '/add-item';

  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final textController = useTextEditingController();
    final itemType = useState<ItemType>(ItemType.none);
    final item = useState<Item>(Item());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addItem),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${item.value.type}'),
          Text('${item.value.name}'),
          Text('${item.value.sellingPrice}'),
          Text('${item.value.stock}'),
          Text('${item.value.wholesalePrice}'),
          Text('${item.value.wholesalePrice}'),
          Text('${item.value.max}'),
          Text('${item.value.min}'),
          Text('${item.value.supplierName}'),
          Text('${item.value.initialPrice}'),
        ],
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          _buildSelectItemType(
            context,
            itemType.value,
            item.value,
            textController,
            pageController,
            (type) {
              itemType.value = type!;
              item.value.type = AddItemUtils().getType(type);
            },
            (type) {
              itemType.value = type!;
              item.value.type = AddItemUtils().getType(type);
            },
          ),
          _buildItemName(
            context,
            textController,
            item.value,
            pageController,
            (text) {
              item.value.name = text.trim();
            },
          ),
          _buildSellingPrice(
            context,
            textController,
            (text) => item.value.sellingPrice = double.parse(text),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectItemType(
    BuildContext context,
    ItemType itemType,
    Item item,
    TextEditingController textController,
    PageController pageController,
    Function(ItemType?) onChanged1,
    Function(ItemType?) onChanged2,
  ) =>
      _ContainerForColumn(
        children: [
          Text(
            '1/n Select an item type',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Palette.slateGray),
          ),
          const SizedBox(height: 8.0),
          RadioListTile<ItemType>(
            value: ItemType.goods,
            groupValue: itemType,
            onChanged: (type1) => onChanged1(type1),
            title: const Text('Goods'),
          ),
          RadioListTile<ItemType>(
            value: ItemType.services,
            groupValue: itemType,
            onChanged: (type2) => onChanged2(type2),
            title: const Text('Services'),
          ),
          const SizedBox(height: 8.0),
          Text(
            AppLocalizations.of(context)!.goodsOrServicesCaption,
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: itemType == ItemType.none
                    ? null
                    : () {
                        _nextPage(pageController, textController);
                      },
                child: const Text('Next'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      );

  Widget _buildItemName(
    BuildContext context,
    TextEditingController textController,
    Item item,
    PageController pageController,
    Function(String) onChanged,
  ) =>
      _ContainerForColumn(
        children: [
          Text(
            '2/n Type the name of the item',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Palette.slateGray),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: textController,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Palette.eerieBlack),
            decoration: const InputDecoration(
              hintText: 'Hint text',
            ),
            onChanged: (text) => onChanged(text),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: item.name == null || item.name!.isEmpty
                    ? null
                    : () {
                        _nextPage(pageController, textController);
                      },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      );

  Widget _buildSellingPrice(BuildContext context,
          TextEditingController controller, Function(String) onChanged) =>
      _ContainerForColumn(
        children: [
          Text(
            'Enter a selling price per item',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Palette.slateGray),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Hint text',
            ),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Palette.eerieBlack),
            keyboardType: TextInputType.number,
            onChanged: (text) => onChanged(text),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Next'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      );

  void _nextPage(
    PageController pageController,
    TextEditingController textController,
  ) {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: kPageTansition,
        curve: Curves.easeInOut,
      );
    }

    if (textController.text.isNotEmpty) {
      textController = TextEditingController.fromValue(TextEditingValue.empty);
    }
  }
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
