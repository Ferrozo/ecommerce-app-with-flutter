import 'package:ecommerce_app_with_flutter/src/data/model/cart/cart_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();

    return null;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'database.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDBColumn);
    return db;
  }

  _createDBColumn(Database db, int version) async {
    await db.execute(
      'CREATE TABLE cart (id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice REAL, productPrice REAL,  quantity INTEGER, img TEXT)',
    );
  }

  Future<Cart> insertToDB(Cart cart) async {
    var db = await database;
    await db!.insert('cart', cart.toMap());

    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var db = await database;
    final List<Map<String, Object?>> queryResult = await db!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> updateQuantity(Cart cart) async {
    var db = await database;
    return db!.update(
      'cart',
      cart.quantityToMap(),
      where: 'productId = ? ',
      whereArgs: [cart.productId],
    );
  }

  Future<int> deleteCartItem(int id) async {
    var db = await database;
    return await db!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}
