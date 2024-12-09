import 'package:get/get.dart';
import 'package:quizapp/helper/routes_value.dart';

class ConfigurationController extends GetxController {
  @override
  void onInit() {
    initialCheck();
    super.onInit();
  }

  initialCheck() async {
    //  await DBHelper.getInstance();
    await Future.delayed(const Duration(milliseconds: 200));
    Get.toNamed(RoutesValue.splashpage);
  }
}
