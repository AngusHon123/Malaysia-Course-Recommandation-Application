import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  DatabaseHelper._internal();

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
  }

  Future<int> insertData(String name, int age) async {
    final db = await database;
    final values = {'name': name, 'age': age};
    return await db.insert('my_table', values);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    return await db.query('my_table');
  }
}
