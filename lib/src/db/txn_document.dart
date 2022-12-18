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
  List<String>? idItems;
  double? total;
  double? payment;
  double? changes;
}
