import 'package:flutter/foundation.dart';

class Cart {
  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.initialPrice,
    required this.quantity,
    required this.img,
  });

  late final int? id;
  final String? productId;
  final String? productName;
  final double? initialPrice;
  final double? productPrice;
  final ValueNotifier<int>? quantity;
  final String? img;

  Cart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        productId = data['productId'],
        productName = data['productName'],
        productPrice = data['productPrice'],
        initialPrice = data['initialPrice'],
        quantity = ValueNotifier(data['quantity']),
        img = data['img'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'initialPrice': initialPrice,
      'quantity': quantity?.value,
      'img': img,
    };
  }

  Map<String, dynamic> quantityToMap() {
    return {
      'productId': productId,
      'quantity': quantity!.value,
    };
  }
}
