import 'dart:convert';
import 'dart:math';

import 'package:quizapp/model/service_model.dart';
import 'package:quizapp/services/service_getapi.dart';

class QuizzApi {
  String? exception;
  int? stcode;
  List<QuizzData>? datalist;

  QuizzApi(
      {required this.datalist, required this.exception, required this.stcode});

  static Future<QuizzApi> callapi() async {
    ResponseModel res = ResponseModel();

    res = await ServiceGet.callApi("https://opentdb.com/api.php?amount=10&category=9&type=multiple");
    return QuizzApi.fromJson(res);
  }

  factory QuizzApi.fromJson(ResponseModel res) {
    if (res.statusCode! <= 210 && res.statusCode! >= 200) {
      Map<String, dynamic> json = jsonDecode(res.body!);
      List<dynamic> data = json["results"] as List;
      List<QuizzData>? result = data.map((e) => QuizzData.fromJson(e)).toList();
      return QuizzApi(
          datalist: result, exception: null, stcode: res.statusCode);
    } else {
      return QuizzApi(
          datalist: null, exception: res.body, stcode: res.statusCode);
    }
  }
}

class QuizzData {
  String? question;
  String? answer;
  List<dynamic>? optionName;
  // List<QuizzOptions2>? tets;
  QuizzData(
      {required this.optionName, required this.answer, required this.question});

  factory QuizzData.fromJson(Map<String, dynamic> json) {
      String correctAnswer = json['correct_answer'];

      List<dynamic> incorrectAnswers = List.from(json['incorrect_answers']);
  incorrectAnswers.add(correctAnswer);
    incorrectAnswers.shuffle(Random());

    return QuizzData(
        optionName: incorrectAnswers,
        answer: json["correct_answer"],
        question: json["question"],
        );
  }
}

class QuizzOptions2 {
  String? optionName2;
  QuizzOptions2({required this.optionName2});

  factory QuizzOptions2.fromJson(Map<String, dynamic> json) {
    return QuizzOptions2(optionName2: json[""]);
  }
}
