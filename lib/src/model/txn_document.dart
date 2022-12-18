import 'package:flutter_receipt_app/src/model/item.dart';

// TXN is abbreviation for transaction
enum TxnType { invoice, receipt, none }

class TxnDocument {
  TxnDocument(
    this.createdAt,
    this.txnType,
    this.to,
    this.paid,
    this.items,
    this.total,
    this.payment,
    this.changes,
  );

  final DateTime createdAt;
  TxnType txnType;
  String to;
  bool paid;
  List<Item> items;
  double total;
  double payment;
  double changes;
}
