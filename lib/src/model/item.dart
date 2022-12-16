enum ItemType { goods, services, none }

class WholesalePrice {
  WholesalePrice(this.max, this.min, this.price);

  int min;
  int max;
  double price;
}

class Item {
  Item(
    this.type,
    this.name,
    this.sellingPrice,
    this.stock,
    this.wholesalePrice,
    this.supplierName,
    this.initialPrice,
  );

  ItemType type;
  String name;
  double sellingPrice;
  int stock;
  WholesalePrice wholesalePrice;
  String supplierName;
  double initialPrice;
}
