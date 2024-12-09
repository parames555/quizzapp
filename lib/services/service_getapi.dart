import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:quizapp/model/service_model.dart';

class ServiceGet {
  static Future<ResponseModel> callApi(String url) async {
    try {
      var res = await http.get(Uri.parse(url));
      return ResponseModel(body: res.body, statusCode: res.statusCode);
    } catch (e) {
      return ResponseModel(body: "$e", statusCode: 500);
    }
  }
}
