// import 'package:quizapp/model/db_model.dart';
// import 'package:sqflite/sqflite.dart';

// class DbOperations {
//   Future<List<DbModel>> getDbData(Database db) async {
//     List<Map<String, Object?>> result =
//         (await db.rawQuery('''select * from $tableQuizz'''));

//     return List.generate(result.length, (i) {
//       return DbModel(
//           answer: result[i]['Question'].toString(),
//           question: result[i]['Answer'].toString(),
//           option1: result[i]['Option1'].toString(),
//           option2: result[i]['Option2'].toString(),
//           option3: result[i]['Option3'].toString(),
//           option4: result[i]['Option4'].toString());
//     });
//   }

//   Future insertQuizz(List<DbModel> values, Database db) async {
//     var data = values.map((e) => e.toMap()).toList();
//     var batch = db.batch();
//     data.forEach((e) {
//       batch.insert(tableQuizz, e);
//     });

//     await batch.commit();
//     print("commit");
//   }
// }
