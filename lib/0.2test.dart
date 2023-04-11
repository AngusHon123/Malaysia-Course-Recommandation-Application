import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

/* class DatabaseHelper {
  static Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mydatabase.db'),
      onCreate: (db, version) {
        // 在此處創建表格，如果需要
        db.execute(
            'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
      version: 1,
    );
  }

  static Future<void> insertUser(String name, int age) async {
    final Database db = await initDatabase();
    await db.insert('users', {'name': name, 'age': age});
  }

  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final Database db = await initDatabase();
    return db.query('users');
  }
} */
class DatabaseHelper {
  static Future<String> getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return join(directory.path, 'mydatabase.db');
  }
  // ...你需要加入 path_provider package，這個 package 提供了一個 getApplicationDocumentsDirectory() 方法，可以獲取 App documents 目錄的路徑，以便在此處存儲數據庫。

  static Future<Database> initDatabase() async {
    final path = await getDatabasePath();
    return openDatabase(
      path,
      onCreate: (db, version) {
        // 在此處創建表格，如果需要
        db.execute(
            'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
      version: 1,
    );
  }
}
