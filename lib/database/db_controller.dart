import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static DbController? _instance;
  late Database _database;

  DbController._();

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'egrocery_db.sql');
    _database = await openDatabase(
      path,
      version: 2,
      onOpen: (Database database) {
        print('db opened');
      },
      onCreate: (Database database, int version) async {
        print('db created');
        await database.execute('CREATE TABLE cart ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'image_url TEXT NOT NULL,'
            'quantity INTEGER NOT NULL,'
            'price REAL NOT NULL,'
            // 'total_price REAL NOT NULL,'
            'product_id INTEGER NOT NULL'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        print('db upgraded');
      },
      onDowngrade: (Database db, int oldVersion, int newVersion) {
        print('db downgraded');
      },
    );
  }
}
