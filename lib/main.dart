import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/configuration_controller.dart';
import 'package:quizapp/helper/app_theme.dart';
import 'package:quizapp/helper/routes_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ConfigurationController>(ConfigurationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      getPages: AllRoutes.pages,
      home: const ConfigurationPage(),
    );
  }
}

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  // final configCnt =Get.find<ConfigurationController>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
