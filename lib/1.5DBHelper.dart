import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'my_database2.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE mytable(id INTEGER PRIMARY KEY, name TEXT,age INT, reaslisticString INT, investigativeString INT, artisticString INT, socialString INT, enterprisingString INT, conventionalString INT, categories1 TEXT, categories2 TEXT, categories3 TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> deleteData(String table, int id) async {
    final db = await DBHelper.database();
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
