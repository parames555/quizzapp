import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/controllers/splash_controller.dart';
import 'package:quizapp/helper/resolutions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashCnt = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    ThemeData theme=Theme.of(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Screen.bodyHeight(context) * 0.13,
              width: Screen.bodyWidth(context) * 0.35,
              // decoration: const BoxDecoration(
              // color: Colors.amber,
              // shape: BoxShape.circle
              // ),
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
                width: Screen.bodyWidth(context) ,
                child: Text("QuizzApp",style: theme.textTheme.titleLarge)),
            SizedBox(
                width: Screen.bodyWidth(context) * 0.2,
                child: Lottie.asset(
                  'assets/spinner.json',
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
