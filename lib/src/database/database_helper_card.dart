import 'dart:async';

import 'package:path/path.dart';
import 'package:shopping_figma_one/src/model/card_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperCard {
  static final DatabaseHelperCard _instance = new DatabaseHelperCard.internal();

  factory DatabaseHelperCard() => _instance;

  final String tableNote = 'cardTable';
  final String columnNumber = 'number';
  final String columnName = 'name';
  final String columnExpiry = 'expiry';
  final String columnSecurityCode = 'securityCode';

  static Database _db;

  DatabaseHelperCard.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cardInfo.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $tableNote('
        '$columnNumber TEXT PRIMARY KEY, '
        '$columnName TEXT, '
        '$columnExpiry TEXT, '
        '$columnSecurityCode TEXT)');
  }

  Future<int> saveProducts(CardModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableNote, item.toMap());
    return result;
  }

  Future<List> getAllProducts() async {
    var dbClient = await db;
    var result = await dbClient.query(tableNote, columns: [
      columnNumber,
      columnName,
      columnExpiry,
      columnSecurityCode,
    ]);

    return result.toList();
  }

  Future<List<CardModel>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableNote');
    List<CardModel> item = new List();
    for (int i = 0; i < list.length; i++) {
      var items = new CardModel(
        number: list[i][columnNumber],
        name: list[i][columnName],
        securityCode: list[i][columnSecurityCode],
        expiry: list[i][columnExpiry],
      );
      item.add(items);
    }
    return item;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableNote'));
  }

  Future<CardModel> getProducts(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableNote,
        columns: [
          columnNumber,
          columnName,
          columnExpiry,
          columnSecurityCode,
        ],
        where: '$columnNumber = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return CardModel.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteProducts(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableNote, where: '$columnNumber = ?', whereArgs: [id]);
  }

  Future<int> updateProduct(CardModel item) async {
    var dbClient = await db;
    return await dbClient.update(tableNote, item.toMap(),
        where: "$columnNumber = ?", whereArgs: [item.number]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNote');
  }
}
