enum ItemType { none, goods, services }

class AddItemUtils {
  int getType(ItemType type) {
    switch (type) {
      case ItemType.goods:
        return 1;
      case ItemType.services:
        return 2;
      default:
        return 0;
    }
  }
}
