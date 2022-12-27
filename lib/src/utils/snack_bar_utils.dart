import 'package:flutter_receipt_app/src/common.dart';

class SnackBarUtils {
  void text(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
}
