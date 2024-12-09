import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String totalscore = "Total";
//  static String sPLocale = "Locale";
  static String currentscore = "CurrentScore";


  static Future<bool> saveTotalscore(String spHost1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(totalscore, spHost1);
  }

  static Future<String?> getTotalscore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(totalscore);
  }

  static clearTotalscore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(totalscore);
  }

}