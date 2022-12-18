import 'package:flutter_receipt_app/src/common.dart';

class AddItem extends StatelessWidget {
  static const routeName = '/add-item';

  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addItem),
      ),
    );
  }
}
