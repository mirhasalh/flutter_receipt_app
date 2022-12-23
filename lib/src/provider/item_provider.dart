import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final itemProvider = StreamProvider<List<Item>>((ref) async* {
  yield* DbUtils().listenItems();
});
