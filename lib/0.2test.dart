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
情緒穩定、有耐性、坦承直率，寧願行動不喜多言，喜歡在講求實際、需要動手環境中從事明確固定的工作，依既定的規則，一步一步地製造完成有實際用途的物品。對機械與工具等事物較有興趣，生活上亦以實用為重，眼前的事重於對未來的想像，比較喜歡獨自做事。
研究型(I)：
善於觀察、思考、分析與推理，喜歡用頭腦依自己的步調解決問題，並追根究底。不喜歡別人給指引，工作時也不喜歡有很多規矩和時間壓力。做事時，能提出新的想法和策略，但對實際解決問題的細節較無興趣。不是很在乎別人的看法，喜歡和有相同興趣或專業的人討論，否則還不如自己看書或思考。 
藝術型(A)：
直覺敏銳、善於表達和創新。希望藉文字、聲音、色彩或形式來表達創造力和美的感受。喜歡獨立作業，但也不想／不喜歡被忽略，在無拘無束的環境下工作效率最好。生活的目的就是創造不平凡的事務，不喜歡管人和被人管，和朋友的關係比較隨興。
企業型(E)：
精力旺盛、生活緊湊、好冒險競爭，做事有計畫並立刻行動。不願花太多時間做科學研究，希望擁有權力去改善不合理的事。善用說服力和組織能力，希望自己的表現被他人肯定，並成為團體的焦點人物。不以現階段的成就為滿足，也要求別人跟他一樣努力。
社會型(S)：
對人和善、容易相處，關心自己和別人的感受，喜歡傾聽和瞭解別人，也願意付出時間和精力去解決別人的困擾。喜歡教導別人，並幫助他人成長。不喜歡競爭，喜歡大家一起做事，一起為團體盡力。容易與人對應、互動，關心人勝過於關心工作。
企業型(E)：
精力旺盛、生活緊湊、好冒險競爭，做事有計畫並立刻行動。不願花太多時間做科學研究，希望擁有權力去改善不合理的事。善用說服力和組織能力，希望自己的表現被他人肯定，並成為團體的焦點人物。不以現階段的成就為滿足，也要求別人跟他一樣努力。
事務型(C)：
個性謹慎、做事講求規矩和精確。喜歡在有清楚規範的環境下工作。做事按部就班、精打細算，給人的感覺是有效率、精確、仔細、可靠而有信用。他們的生活哲學是穩紮穩打，不喜歡改變或創新，也不喜歡冒險或領導。會選擇和自己志趣相投的人為好朋友。*/