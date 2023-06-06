import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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

/* 
實做型(R)：
Emotionally stable and patient, they would rather act than talk. Have the ability to operate machinery, like to do things alone and follow the established rules, step by step to manufacture and complete practical objects.
研究型(I)：
Have mathematical ability and the spirit of scientific research, like to observe, research, think, analyze and solve problems, and don't like others to give guidance. I also don't like having a lot of rules and time pressure at work. When doing things, can come up with new ideas and strategies, but is less interested in the details of actually solving problems. Don't care much about other people's opinions.
藝術型(A)：
Artistic, intuitive, and creative. Like to use imagination and creativity, engage in aesthetic creation, and hope to express creativity and beauty through words, sounds, colors or forms. Likes to work independently, but also doesn't want/like to be ignored, works best in an uninhibited environment.
社會型(S)：
Kind and easy to get along with people, cares about own and others' feelings, likes to listen to and understand others, and is willing to devote time and energy to solving other people's troubles and helping them grow. Don't like competition, but like to work in a team.
企業型(E)：
Energetic, compact life, adventurous and competitive, have a plan and act immediately. Like to use influence and persuasion to improve unreasonable things. Pursue political or economic achievements, and hope that their performance will be affirmed by others and become the focus of the group.
事務型(C)：
Have agile clerical and computing skills, like to deal with clerical or digital materials. Do things with rules and precision. Likes to work in an environment with clear rules. Their philosophy of life is to play it safe and not like change or innovation, taking risks or leading.*/