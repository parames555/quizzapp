import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/controllers/dashboard_controller.dart';
import 'package:quizapp/helper/db_helper/sharedpref.dart';
import 'package:quizapp/helper/resolutions.dart';
import 'package:quizapp/helper/routes_value.dart';
import 'package:quizapp/view/pages/dashboard/widgets/chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashCnt = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // dashCnt.onInit();
    return Obx(() {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xfffff6e9),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
              ),
              Column(
                children: [
                  Container(
                    width: Screen.bodyWidth(context),
                    height: Screen.bodyHeight(context) * 0.3,
                    padding: EdgeInsets.all(Screen.bodyHeight(context) * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: Screen.bodyHeight(context) * 0.04,
                        ),
                        Text(
                          " Welcome",
                          style: theme.textTheme.headlineLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " to QuizzApp",
                          style: theme.textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Quiz yourself, challenge your mind,\nand grow beyond limits",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.actorTextTheme().bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(Screen.bodyHeight(context) * 0.01),
                    child: Container(
                      padding:
                          EdgeInsets.all(Screen.bodyHeight(context) * 0.008),
                      width: Screen.bodyWidth(context),
                      height: Screen.bodyHeight(context) * 0.28,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300]!,
                                spreadRadius: 1.0,
                                blurRadius: 1.0)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Screen.bodyWidth(context) / 2.4,
                                child: Column(
                                  children: [
                                    IntrinsicHeight(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Progress",
                                                style: theme
                                                    .textTheme.bodyLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                "100 /",
                                                style: theme
                                                    .textTheme.headlineLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            " ${dashCnt.currentTotal.value.toString()}",
                                            style: theme
                                                .textTheme.headlineSmall!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: dashCnt.currentTotal
                                                                .value <
                                                            40
                                                        ? Colors.redAccent
                                                        : dashCnt.currentTotal
                                                                    .value <
                                                                65
                                                            ? Colors.orange
                                                            : Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Screen.bodyHeight(context) * 0.02,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: Screen.bodyWidth(context) /
                                                  2.9,
                                              child: Text(
                                                "Correct Answers ",
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green),
                                              ),
                                            ),
                                            Text(
                                              "${dashCnt.currentTotal.value}",
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: Screen.bodyWidth(context) /
                                                  2.9,
                                              child: Text(
                                                "Attempt Ques ",
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
                                              ),
                                            ),
                                            Text(
                                              "${dashCnt.attemptTotal.value}",
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: Screen.bodyWidth(context) /
                                                  2.9,
                                              child: Text(
                                                "Wrong Answers ",
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.redAccent),
                                              ),
                                            ),
                                            Text(
                                              "${dashCnt.attemptTotal.value - dashCnt.currentTotal.value}",
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: Screen.bodyWidth(context) * 0.5,
                                  height: Screen.bodyHeight(context) * 0.25,
                                  child: Chartwidget(dashCnt: dashCnt))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesValue.quizzpage);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.all(Screen.bodyHeight(context) * 0.01),
                      child: Container(
                        width: Screen.bodyWidth(context),
                        height: Screen.bodyHeight(context) * 0.2,
                        decoration: BoxDecoration(
                            // color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.red, Colors.pink, Colors.red]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300]!,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0)
                            ]),
                        child: Center(
                          child: Text(
                            "Play Quizz",
                            style: theme.textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      dashCnt.resetProgress();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.all(Screen.bodyHeight(context) * 0.01),
                      child: Container(
                        width: Screen.bodyWidth(context),
                        height: Screen.bodyHeight(context) * 0.08,
                        decoration: BoxDecoration(
                            // color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Colors.grey,
                              Colors.blueGrey,
                              Colors.brown
                            ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300]!,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0)
                            ]),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: theme.textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: Screen.bodyHeight(context) / 1.2,
                right: Screen.bodyWidth(context) / 1.5,
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
                bottom: Screen.bodyHeight(context) / 1.32,
                right: Screen.bodyWidth(context) / 1.3,
                child: Container(
                    width: Screen.bodyWidth(context) * 0.4,
                    height: Screen.bodyHeight(context) * 0.2,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1.0,
                          blurRadius: 1.0)
                    ], color: Colors.blue, shape: BoxShape.circle)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
