import 'package:flutter_receipt_app/src/db/item.dart';
import 'package:isar/isar.dart';

part 'txn_document.g.dart';

// TXN is abbreviation for transaction
@collection
class TxnDocument {
  Id id = Isar.autoIncrement;
  String? createdAt;
  int? txnType;
  String? to;
  bool? paid;
  var items = IsarLinks<Item>();
  double? total;
  double? payment;
  double? changes;
}
