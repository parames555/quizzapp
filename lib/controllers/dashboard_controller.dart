import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quizapp/helper/db_helper/db_helper.dart';
// import 'package:quizapp/helper/db_helper/db_operations.dart';
import 'package:quizapp/model/db_model.dart';
import 'package:quizapp/model/quizz_api.dart';
// import 'package:sqflite/sqflite.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    callapi();
    super.onInit();
  }

  List<QuizzData> quizzData = [];
  callapi() async {
    await QuizzApi.callapi().then((value) {
      if (value.stcode! <= 210 && value.stcode! >= 200) {
        quizzData = value.datalist!;
        // insertDb(quizzData);
        print(quizzData.length);
      } else {
        callapi();
        // Get.dialog(AlertDialog(
        //   title: Text("${value.exception}"),
        // ));
      }
    });
  }

  // insertDb(List<QuizzData> quizzData) async {
  //   List<DbModel> values = [];
  //   Database? db = await DBHelper.getInstance();
  //   DbOperations dboperation = DbOperations();
  //   for (var data in quizzData) {
  //     List<String> options = data.optionName.toString().split(',');
  //     values.add(DbModel(
  //         answer: data.answer,
  //         question: data.question,
  //         option1: options[0],
  //         option2: options[1],
  //         option3: options[2],
  //         option4: options[3]));
  //   }

  //   await dboperation.insertQuizz(values, db!);
  // }
}
