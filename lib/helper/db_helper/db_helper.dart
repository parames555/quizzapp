// import 'dart:developer';
// import 'package:path/path.dart';
// import 'package:quizapp/model/db_model.dart';
// import 'package:sqflite/sqflite.dart';

// class DBHelper {
//   static Database? _db;

//   DBHelper._();

//   static Future<Database?> getInstance() async {
//     String path = await getDatabasesPath();
//     log("path of data: $path");
//     if (_db == null) {
//       _db = await openDatabase(join(path, 'quizzdb.db'),
//           version: 1, onCreate: createTable);
//       log("test:: ${_db!.path}");
//     }
//     return _db;
//   }

//   static void createTable(Database database, int version) async {
//     await database.execute('''
//            create table $tableQuizz(
//              QId integer primary key autoincrement,
//              ${QuizzTable.question} varchar not null,
//              ${QuizzTable.answer} varchar not null,
//              ${QuizzTable.option1} varchar not null,
//              ${QuizzTable.option2} varchar not null,
//              ${QuizzTable.option3} varchar not null,
//              ${QuizzTable.option4} varchar not null
//              )
//         ''');
//   }

// }
