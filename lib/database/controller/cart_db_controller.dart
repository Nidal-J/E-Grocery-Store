import 'package:e_grocery/database/db_controller.dart';
import 'package:e_grocery/database/db_operations.dart';
import 'package:e_grocery/models/cart.dart';
import 'package:sqflite/sqflite.dart';

class CartDbController implements DbOperations<CartProduct> {
  final Database _database = DbController().database;

  @override
  Future<int> create(CartProduct cart) {
    return _database.insert(CartProduct.tableName, cart.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int numberOfDeletedRows = await _database
        .delete(CartProduct.tableName, where: 'id = ?', whereArgs: [id]);
    return numberOfDeletedRows == 1;
  }

  @override
  Future<List<CartProduct>> read() async {
    List<Map<String, dynamic>> rowMaps =
        await _database.query(CartProduct.tableName);
    return rowMaps
        .map<CartProduct>((rowMap) => CartProduct.fromMap(rowMap))
        .toList();
  }

  @override
  Future<bool> update(CartProduct cart) async {
    int numberOfUpdatedRows = await _database.update(
        CartProduct.tableName, cart.toMap(),
        where: 'id = ?', whereArgs: [cart.id]);
    print(numberOfUpdatedRows);
    return numberOfUpdatedRows == 1;
  }
}

// import 'package:e_grocery/database/db_controller.dart';
// import 'package:e_grocery/database/db_operations.dart';
// import 'package:e_grocery/carts/cart.dart';
// import 'package:sqflite/sqflite.dart';

// class CartDbController implements DbOperations<Cart> {
//   final Database _database = DbController().database;

//   @override
//   Future<int> create(Cart cart) {
//     // int newRowId = await _database.rawInsert(
//     //     'INSERT INTO Carts (title, info, user_id) VALUES (?, ?, ?)',
//     //     [cart.title, cart.info, cart.userId]);
//     return _database.insert(Cart.tableName, cart.toJson());
//   }

//   @override
//   Future<bool> delete(int id) async {
//     // int countOfDeletedRows = await _database.rawDelete('DELETE FROM Carts WHERE id = ?',[id]);
//     int countOfDeletedRows = await _database
//         .delete(Cart.tableName, where: 'id = ?', whereArgs: [id]);
//     return countOfDeletedRows > 0;
//   }

//   @override
//   Future<List<Cart>> read() async {
//     // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM Carts');

//     int userId =
//         SharedPrefController().getValueFor<int>(key: PrefKeys.id.name) ?? -1;
//     List<Map<String, dynamic>> rowsMap = await _database
//         .query(Cart.tableName, where: 'user_id = ?', whereArgs: [userId]);
//     return rowsMap.map((rowMap) => Cart.fromMap(rowMap)).toList();
//   }

//   @override
//   Future<Cart?> show(int id) async {
//     // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM Carts WHERE id = ?', [id]);
//     List<Map<String, dynamic>> rowsMap =
//         await _database.query(Cart.tableName, where: 'id = ?', whereArgs: [id]);
//     return rowsMap.isCartmpty ? Cart.fromMap(rowsMap.first) : null;
//   }

//   @override
//   Future<bool> update(Cart cart) async {
//     // int countOfUpdatedRows = await _database.rawUpdate(
//     //     'UPDATE Carts SET title = ?, info = ? WHERE id = ?',
//     //     [cart.title, cart.info, cart.id]);
//     int countOfUpdatedRows = await _database.update(
//         Cart.tableName, cart.toMap(),
//         where: 'id = ?', whereArgs: [cart.id]);
//     return countOfUpdatedRows > 0;
//   }
// }
// /**
//  * CRUD
//  * C => Create
//  * R => Read
//  * U => Update
//  * D => Delete
//  */

// // Future<int> create(Cart Cart) async {}
// // Future<List<Cart>> read() async {}
// // Future<Cart?> show(int id) async {}
// // Future<bool> update(Cart Cart) async {}
// // Future<bool> delete(int id) async {}
