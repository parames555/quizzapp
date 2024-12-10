import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/helper/db_helper/sharedpref.dart';
import 'package:quizapp/helper/routes_value.dart';
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

  RxInt currentQuesIndex = 0.obs;
  RxInt score = 0.obs;
  RxInt wrong = 0.obs;

  RxBool isloading = false.obs;
  var quizzData = <QuizzData>[].obs;

  Future<void> callapi() async {
    quizzData.value = [];
    isloading = true.obs;
    // await Future.delayed(const Duration(milliseconds: 400));
    QuizzApi.callapi().then((value) {
      if (value.stcode! <= 210 && value.stcode! >= 200) {
        quizzData.value = value.datalist!;
        refresh();
        print(quizzData.length);
      } else {
        // callapi();
        Get.dialog(AlertDialog(
            title: const Text("Something went wrong Try again..!!"),
            actions: [
              IconButton(
                  onPressed: () {
                    callapi();
                    Get.back();
                  },
                  icon: const Icon(Icons.refresh))
            ]));
      }
    });
    isloading = false.obs;
    update();
  }

  Future<void> nextQuestion(
      int selectedOptionIndex, String value, BuildContext context) async {
    int? attemptQues = await SharedPref.getAttemptQues();
    int? totalscore = await SharedPref.getTotalscore();
    print('Attempt:' + attemptQues.toString());

    if (attemptQues == null) {
      attemptQues = 1;
    } else {
      attemptQues++;
    }
    update();
    await SharedPref.saveAttemptQues(attemptQues);

    if (value == quizzData[currentQuesIndex.value].answer) {
      score.value++;
      if (totalscore == null) {
        totalscore = 1;
      } else {
        totalscore = totalscore + 1;
      }
      await SharedPref.saveTotalscore(totalscore);
    }else{
      wrong++;
    }

    if (currentQuesIndex < quizzData.length - 1) {
      currentQuesIndex.value++;
      // update();
    } else {
       print("Attempt:${attemptQues}");
    print("Correct:${totalscore}");
    print("Wrong:${wrong}");
      showResult(context);
    }
    update();

  }

  void showResult(BuildContext context) {
    ThemeData theme=Theme.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          
          title:  Text("Quiz Finished",style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
          content: Row(
            children: [
              Text("Your score:"),
              Text(" $score/${quizzData.length}",style: theme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          backgroundColor: Color(0xfffff6e9),
          actions: [
            TextButton(
              onPressed: () {
                currentQuesIndex.value = 0;
                score.value = 0;
                Get.offAllNamed(RoutesValue.dashboard);
              },
              child: const Text("Dashboard"),
            ),
            TextButton(
              onPressed: () {
                currentQuesIndex.value = 0;
                score.value = 0;
                callapi();
                update();

                Get.back();
              },
              child: const Text("Restart"),
            ),
          ],
        );
      },
    );
  }

}
