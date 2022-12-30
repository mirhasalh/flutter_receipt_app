import 'package:flutter_receipt_app/src/common.dart';

class InfoPage extends StatelessWidget {
  static const routeName = '/info';

  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.personalization),
      ),
    );
  }
}
