import 'package:isar/isar.dart';

part 'supplier.g.dart';

@collection
class Supplier {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  String? supplierName;
}
