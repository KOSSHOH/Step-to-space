import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperHistory {
  static final DatabaseHelperHistory _instance =
      new DatabaseHelperHistory.internal();

  factory DatabaseHelperHistory() => _instance;

  final String tableNote = 'historyTable';
  final String columnName = 'name';

  static Database _db;

  DatabaseHelperHistory.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'history.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableNote('
      '$columnName TEXT PRIMARY KEY)',
    );
  }

  Future<int> saveProducts(String item) async {
    var dbClient = await db;
    var map = new Map<String, dynamic>();
    map[columnName] = item;
    var result = await dbClient.insert(tableNote, map);
    return result;
  }

  Future<List> getAllProducts() async {
    var dbClient = await db;
    var result = await dbClient.query(tableNote, columns: [
      columnName,
    ]);

    return result.toList();
  }

  Future<List<String>> getProdu() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableNote');
    List<String> products = new List();
    for (int i = list.length - 1; i >= 0; i--) {
      var items = list[i][columnName];
      products.add(items);
    }
    // for (int i = 0; i < list.length; i++) {
    //   var items = list[i][columnName];
    //   products.add(items);
    // }
    return products;
  }

  Future<int> getProducts(String id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableNote,
        columns: [
          columnName,
        ],
        where: '$columnName = ?',
        whereArgs: [id]);

    return result.length;
  }

  Future<int> deleteProducts(String id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableNote, where: '$columnName = ?', whereArgs: [id]);
  }

  Future<int> updateProduct(String item) async {
    var dbClient = await db;
    var map = new Map<String, dynamic>();
    map[columnName] = item;
    return await dbClient
        .update(tableNote, map, where: "$columnName = ?", whereArgs: [item]);
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNote');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
