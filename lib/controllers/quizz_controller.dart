import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quizapp/helper/db_helper/db_helper.dart';
// import 'package:quizapp/helper/db_helper/db_operations.dart';
import 'package:quizapp/model/quizz_api.dart';
// import 'package:sqflite/sqflite.dart';

class QuizzController extends GetxController {
  @override
  void onInit() {
    callapi();
    super.onInit();
  }

  bool isloading = true;
  List<QuizzData> quizzData = [];
  Future<void> callapi() async {
    quizzData = [];
    await QuizzApi.callapi().then((value) {
      if (value.stcode! <= 210 && value.stcode! >= 200) {
        quizzData = value.datalist!;
        // insertDb(quizzData);
            update();

        print(quizzData.length);
      } else {
        callapi();
        // Get.dialog(AlertDialog(
        //   title: Text("${value.exception}"),
        // ));
      }
    });
    isloading = false;
    update();
  }

  // List of questions
  // List<Question> questions = [
  //   Question(
  //     questionText: "What is the capital of France?",
  //     options: ["Berlin", "Madrid", "Paris", "Rome"],
  //     correctAnswerIndex: 2,
  //   ),
  //   Question(
  //     questionText: "What is 2 + 2?",
  //     options: ["3", "4", "5", "6"],
  //     correctAnswerIndex: 1,
  //   ),
  //   Question(
  //     questionText: "Which planet is known as the Red Planet?",
  //     options: ["Earth", "Mars", "Jupiter", "Saturn"],
  //     correctAnswerIndex: 1,
  //   ),
  // ];


  
}
