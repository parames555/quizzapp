import 'package:get/get.dart';
import 'package:quizapp/helper/routes_value.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    naviDashboard();
    super.onInit();
  }

  naviDashboard() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(RoutesValue.dashboard);
  }
}
