import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import 'package:lexi_mobile/models/question_model.dart';

import '../config/api.config.dart';

class QuestionRepository {
  Future<Question> findOneById(String? id) async {
    Question question;
    String token = await SessionManager().get("token");
    var jsonResponse = await get(
        Uri.https(
            apiConfig["baseUrl"], "${apiConfig["uri"]}/question/$id/info"),
        headers: {'Authorization': 'Bearer $token'});
    var response = json.decode(jsonResponse.body);
    question = Question.fromJson(response);
    return question;
  }
}
