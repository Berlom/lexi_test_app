import 'dart:convert';

import 'package:lexi_mobile/models/question_model.dart';
import 'package:lexi_mobile/repository/question_repository.dart';

enum QuizResponse { A, B, C }

class QuestionViewModel {
  static String? chosenOption;
  Question? question;
  Future<Question> getQuestion(String id) async {
    return await QuestionRepository().findOneById(id);
  }

  String getResponseBody(var jsonResponse, String value) {
    return jsonDecode(jsonResponse)![value].toString();
  }
}
