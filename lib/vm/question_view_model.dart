import 'dart:convert';

import '../models/question_model.dart';
import '../repository/question_repository.dart';

enum QuizResponse { A, B, C }

class QuestionViewModel {
  static String? chosenOption;
  static String? currentQuestionAnswer;
  Future<Question> getQuestion(String id) {
    return QuestionRepository().findOneById(id);
  }

  //get the quiz answers
  String getResponseBody(var jsonResponse, String value) {
    return jsonDecode(jsonResponse)![value].toString();
  }
}
