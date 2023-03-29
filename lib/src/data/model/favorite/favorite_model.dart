import 'dart:collection';

import 'package:ecommerce_app_with_flutter/src/data/model/product_model.dart';
import 'package:flutter/foundation.dart';

class FavoriteModel extends ChangeNotifier {
  final List<ProductModel> _items = [];

  UnmodifiableListView<ProductModel> get items => UnmodifiableListView(_items);
  int get totalFavorite => _items.length;

  void add(ProductModel product) {
    if (_items.contains(product)) {
      _items.remove(product);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void removeItem(ProductModel product) {
    _items.remove(product);
    notifyListeners();
  }
}
