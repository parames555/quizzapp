import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/dashboard_controller.dart';
import 'package:quizapp/helper/resolutions.dart';
import 'package:quizapp/helper/routes_value.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final splashCnt = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: theme.textTheme.bodyLarge!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xfffff6e9),
      ),
      body: Container(
        width: Screen.bodyWidth(context),
        height: Screen.bodyHeight(context),
        color: Color(0xfffff6e9),
        padding: EdgeInsets.all(Screen.bodyHeight(context) * 0.01),
        child: Stack(
          children: [
            SizedBox(
              width: Screen.bodyWidth(context),
              height: Screen.bodyHeight(context),
            ),

            Column(
              children: [
                // Container(
                //   width: Screen.bodyWidth(context),
                //   height: Screen.bodyHeight(context) * 0.5,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: const [
                //         BoxShadow(
                //             color: Colors.grey,
                //             spreadRadius: 0.2,
                //             blurRadius: 0.1)
                //       ]),
                // ),
                // SizedBox(
                //   height: Screen.bodyHeight(context) * 0.004,
                // ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesValue.quizzpage);
                  },
                  child: Container(
                    width: Screen.bodyWidth(context),
                    height: Screen.bodyHeight(context) * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Center(
                      child: Text("Play Quizz",style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
