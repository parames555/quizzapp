import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/controllers/quizz_controller.dart';
import 'package:quizapp/helper/resolutions.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final quizzCnt = Get.put(QuizzController());
  int currentQuesIndex = 0;
  int score = 0;

  Future<void> nextQuestion(
      int selectedOptionIndex, String value, BuildContext context)async {
    // print(value +
    //     quizzData[currentQuesIndex].answer.toString() +
    //     ' ' +
    //     selectedOptionIndex.toString());
    if (value == quizzCnt.quizzData[currentQuesIndex].answer) {
      score=score+1;
    }

    if (currentQuesIndex < quizzCnt.quizzData.length - 1) {
      currentQuesIndex=currentQuesIndex+1;
    } else {
      showResult(context);
    }
  }
void showResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quiz Finished"),
          content: Text("Your score: $score/${quizzCnt.quizzData.length}"),
          actions: [
            TextButton(
              onPressed: () {
                currentQuesIndex = 0;
                score = 0;
                Navigator.of(context).pop();
              },
              child: const Text("Restart"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: quizzCnt.isloading
            ? Center(
                child: SizedBox(
                    width: Screen.bodyWidth(context) * 0.2,
                    child: Lottie.asset('assets/spinner.json')),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    quizzCnt.quizzData[currentQuesIndex].question!+'+'+quizzCnt.quizzData[currentQuesIndex].answer!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...quizzCnt
                      .quizzData[currentQuesIndex].optionName!
                      .asMap()
                      .entries
                      .map((entry) {
                    int idx = entry.key;
                    String option = entry.value;
                    return ElevatedButton(
                      onPressed: () =>
                          nextQuestion(idx, option, context),
                      child: Text(option),
                    );
                  }).toList(),
                ],
              ),
      ),
    );
  }

  // int? selectedRadioTile;

  // @override
  // void initState() {
  //   super.initState();
  //   selectedRadioTile = 0;
  // }

  // setSelectedRadioTile(int val) {
  //   setState(() {
  //     selectedRadioTile = val;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       title: const Text("Quizz"),
  //     ),
  //     body: Container(
  //       padding: EdgeInsets.all(Screen.bodyHeight(context) * 0.008),
  //       width: Screen.bodyWidth(context),
  //       height: Screen.bodyHeight(context),
  //       child: ListView.builder(
  //           itemCount: 2,
  //           itemBuilder: (context, index) {
  //             return Container(
  //               padding: EdgeInsets.all(Screen.bodyHeight(context) * 0.008),
  //               margin:
  //                   EdgeInsets.only(bottom: Screen.bodyHeight(context) * 0.004),
  //               width: Screen.bodyWidth(context),
  //               // height: Screen.bodyHeight(context)*0.2,
  //               decoration: BoxDecoration(
  //                   color: Colors.blueAccent,
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     width: Screen.bodyWidth(context),
  //                     padding:
  //                         EdgeInsets.all(Screen.bodyHeight(context) * 0.006),
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(5),
  //                         color: Colors.white),
  //                     child: const Text(
  //                         "afdasfasf asdasdk asopdjoijasodjas oajsdojiaoijsd aosjidoiajsd oajsodijasd "),
  //                   ),
  //                   SizedBox(
  //                     height: Screen.bodyHeight(context) * 0.006,
  //                   ),
  //                   Container(
  //                     width: Screen.bodyWidth(context),
  //                     padding:
  //                         EdgeInsets.all(Screen.bodyHeight(context) * 0.006),
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(5),
  //                         color: Colors.white),
  //                     child: IntrinsicHeight(
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Container(
  //                             width: Screen.bodyWidth(context) / 2.3,
  //                             child: RadioListTile(
  //                               contentPadding: EdgeInsets.zero,
  //                               value: 1,
  //                               groupValue: selectedRadioTile,
  //                               title: const Text("Radio 1 rgsd sdfgsdg sdgsdg sdgsdg",),
  //                               onChanged: (val) {
  //                                 setSelectedRadioTile(val!);
  //                               },
  //                               activeColor: Colors.red,
  //                               selected: true,
  //                             ),
  //                           ),
  //                           Container(
  //                             width: Screen.bodyWidth(context) / 2.3,
  //                             child: RadioListTile(
  //                               contentPadding: EdgeInsets.zero,
  //                               value: 2,
  //                               groupValue: selectedRadioTile,
  //                               title: const Text("Radio 2"),
  //                               onChanged: (val) {
  //                                 setSelectedRadioTile(val!);
  //                               },
  //                               activeColor: Colors.red,
  //                               selected: false,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             );
  //           }),
  //     ),
  //   );
  // }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
