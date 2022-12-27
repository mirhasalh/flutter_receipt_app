import 'package:isar/isar.dart';

part 'item.g.dart';

@collection
class Item {
  Id id = Isar.autoIncrement;
  int? type;
  @Index(unique: true)
  String? name;
  double? sellingPrice;
  int? stock;
  double? wholesalePrice;
  int? max;
  int? min;
  String? supplierName;
  double? initialPrice;
}
