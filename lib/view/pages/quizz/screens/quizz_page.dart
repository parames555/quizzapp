import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xfffff6e9),
        body: (quizzCnt.currentQuesIndex.value == 0 &&
                quizzCnt.quizzData.isEmpty)
            ? Center(
                child: SizedBox(
                    width: Screen.bodyWidth(context) * 0.2,
                    child: Lottie.asset('assets/spinner.json')),
              )
            : Stack(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Screen.bodyWidth(context),
                        height: Screen.bodyHeight(context) * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Screen.bodyHeight(context) * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: Screen.bodyWidth(context) * 0.15,
                                    height: Screen.bodyHeight(context) * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[500]!,
                                            blurRadius: 2.0,
                                            spreadRadius: 1.0)
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "${quizzCnt.score.value}",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: Screen.bodyWidth(context) * 0.15,
                                    height: Screen.bodyHeight(context) * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[500]!,
                                            blurRadius: 2.0,
                                            spreadRadius: 1.0)
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: quizzCnt.currentQuesIndex.value == 0
                                        ? Text(
                                            "0",
                                            style: theme.textTheme.bodyLarge,
                                          )
                                        : Text(
                                            "${(quizzCnt.currentQuesIndex.value - quizzCnt.score.value) + 1}",
                                            style: theme.textTheme.bodyLarge,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: Screen.bodyWidth(context),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Colors.blueAccent,
                                    Colors.grey[300]!,
                                    Colors.blue,
                                  ]),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1.0,
                                        blurRadius: 1.0)
                                  ]),
                              child: Column(
                                children: [
                                  Text(
                                    'QUESTIONS ${quizzCnt.currentQuesIndex.value + 1} OF ${quizzCnt.quizzData.length} ',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        // fontWeight: FontWeight.bold
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Divider(),
                                  Text(
                                    '${quizzCnt.quizzData[quizzCnt.currentQuesIndex.value].question!}}',
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ...quizzCnt
                                .quizzData[quizzCnt.currentQuesIndex.value]
                                .optionName!
                                .asMap()
                                .entries
                                .map((entry) {
                              int idx = entry.key;
                              String option = entry.value;
                              return ElevatedButton(
                                onPressed: () =>
                                    quizzCnt.nextQuestion(idx, option, context),
                                child: Text(option),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: Screen.bodyHeight(context) / 1.2,
                    left: Screen.bodyWidth(context) / 1.5,
                    child: Container(
                        width: Screen.bodyWidth(context) * 0.4,
                        height: Screen.bodyHeight(context) * 0.2,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1.0,
                              blurRadius: 1.0)
                        ], color: Colors.amber, shape: BoxShape.circle)),
                  ),
                  Positioned(
                    top: Screen.bodyHeight(context) / 1.32,
                    left: Screen.bodyWidth(context) / 1.3,
                    child: Container(
                        width: Screen.bodyWidth(context) * 0.4,
                        height: Screen.bodyHeight(context) * 0.2,
                        decoration:  const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1.0,
                              blurRadius: 1.0)
                        ],
                            color: Colors.blue, shape: BoxShape.circle)),
                  ),
                ],
              ),
      );
    });
  }

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
