import 'package:flutter_receipt_app/src/db/dbs.dart';
import 'package:isar/isar.dart';

// Isar db utilities
class DbUtils {
  late Future<Isar> db;

  DbUtils() {
    db = openDB();
  }

  Future<void> addItem(Item item) async {
    final isar = await db;

    isar.writeTxnSync<int>(() => isar.items.putSync(item));
  }

  Future<void> addSupplier(Supplier supplier) async {
    final isar = await db;

    isar.writeTxnSync<int>(() => isar.suppliers.putSync(supplier));
  }

  Stream<List<Supplier>> listenSuppliers() async* {
    final isar = await db;

    yield* isar.suppliers.where().watch(fireImmediately: true);
  }

  Future<void> deleteSuppliers(Set<int> ids) async {
    final isar = await db;

    var list = ids.toList();

    await isar.writeTxn(() async => await isar.suppliers.deleteAll(list));
  }

  // Obtain isar db
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ItemSchema, SupplierSchema, TxnDocumentSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
