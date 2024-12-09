import 'package:get/get.dart';
import 'package:quizapp/helper/routes_value.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/view/pages/dashboard/screens/dashboard_page.dart';
import 'package:quizapp/view/pages/quizz/screens/quizz_page.dart';
import 'package:quizapp/view/pages/splash.dart/screens/splash_page.dart';

class AllRoutes {
  static List<GetPage> pages = [
    GetPage(
        name: RoutesValue.configpage, page: () => const ConfigurationPage()),
    GetPage(name: RoutesValue.splashpage, page: () => const SplashPage(),transition:  Transition.downToUp    ),
    GetPage(name: RoutesValue.dashboard, page: () => const DashboardPage(),transition:  Transition.downToUp ),
    GetPage(name: RoutesValue.quizzpage, page: () => const QuizzPage(),transition:  Transition.fade ),
    
  ];
}
