import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:quizapp/helper/db_helper/db_helper.dart';
// import 'package:quizapp/helper/db_helper/db_operations.dart';

import '../helper/db_helper/sharedpref.dart';
// import 'package:sqflite/sqflite.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    // callapi();
    totalMethod();
    super.onInit();
  }
// late TooltipBehavior tooltip;
  RxInt currentTotal = 0.obs;
     var data=<ChartData>[].obs;

  RxInt attemptTotal = 0.obs;
    TooltipBehavior tooltip = TooltipBehavior(enable: true);
 
  // List<QuizzData> quizzData = [];
  // callapi() async {
  //   await QuizzApi.callapi().then((value) {
  //     if (value.stcode! <= 210 && value.stcode! >= 200) {
  //       quizzData = value.datalist!;
  //       // insertDb(quizzData);
  //       print(quizzData.length);
  //     } else {
  //       callapi();
  //       // Get.dialog(AlertDialog(
  //       //   title: Text("${value.exception}"),
  //       // ));
  //     }
  //   });
  // }
  

  Future<void> totalMethod() async {
    int? totalscore = await SharedPref.getTotalscore() ?? 0;
    int? attemptQues = await SharedPref.getAttemptQues() ?? 0;
    currentTotal.value = totalscore;
    attemptTotal.value = attemptQues;
    data = [
      ChartData('Attempt Que', attemptTotal.value),
      ChartData('Correct', currentTotal.value),
      ChartData('Wrong', (attemptTotal.value-currentTotal.value)),
    ].obs;
    print("Attempt:${attemptTotal.value}");
    print("Correct:${currentTotal.value}");
    print("Wrong:${attemptTotal.value-currentTotal.value}");

    update();
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

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final int y;
}
