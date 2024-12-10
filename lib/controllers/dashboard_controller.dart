import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:quizapp/helper/db_helper/db_helper.dart';
// import 'package:quizapp/helper/db_helper/db_operations.dart';

import '../helper/db_helper/sharedpref.dart';
// import 'package:sqflite/sqflite.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    totalMethod();
    super.onInit();
  }

  RxInt currentTotal = 0.obs;
  var data = <ChartData>[].obs;

  RxInt attemptTotal = 0.obs;
  TooltipBehavior tooltip = TooltipBehavior(enable: true);

  Future<void> totalMethod() async {
    int? totalscore = await SharedPref.getTotalscore() ?? 0;
    int? attemptQues = await SharedPref.getAttemptQues() ?? 0;
    currentTotal.value = totalscore;
    attemptTotal.value = attemptQues;
    if (attemptTotal.value == 0) {
      data = [
        ChartData("Test", 1,Colors.grey),
      ].obs;
    } else {
      data = [
        ChartData('Attempt Que', attemptTotal.value,Colors.blueAccent),
        ChartData('Correct', currentTotal.value,Colors.green),
        ChartData('Wrong', (attemptTotal.value - currentTotal.value),Colors.red),
      ].obs;
    }

    print("Attempt:${attemptTotal.value}");
    print("Correct:${currentTotal.value}");
    print("Wrong:${attemptTotal.value - currentTotal.value}");

    update();
  }

  resetProgress() async {
    await SharedPref.clearAttemptQues();
    await SharedPref.clearTotalscore();
    attemptTotal.value = 0;
    currentTotal.value = 0;
    data.clear();
    update();
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final Color color;
  final String x;
  final int y;
}
