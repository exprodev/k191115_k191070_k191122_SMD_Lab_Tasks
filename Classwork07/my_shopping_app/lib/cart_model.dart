import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:my_shopping_app/item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice =>
      _items.fold(0, (total, current) => total + current.price);

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
