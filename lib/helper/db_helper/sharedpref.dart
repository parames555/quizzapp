import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String totalscore = "Total";
//  static String sPLocale = "Locale";
  static String attemptQues = "AttemptQues";


  static Future<bool> saveTotalscore(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(totalscore, value);
  }

  static Future<int?> getTotalscore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(totalscore);
  }

  static clearTotalscore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(totalscore);
  }
  //
  static Future<bool> saveAttemptQues(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(attemptQues, value);
  }

  static Future<int?> getAttemptQues() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(attemptQues);
  }

  static clearAttemptQues() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(attemptQues);
  }

}