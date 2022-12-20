import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final suppliersProvider = StreamProvider<List<Supplier>>((ref) async* {
  yield* DbUtils().listenSuppliers();
});
