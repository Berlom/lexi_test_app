import 'package:flutter/cupertino.dart';
import 'package:lexi_mobile/vm/question_view_model.dart';

import '../models/serie_model.dart';
import '../repository/serie_test_repository.dart';

class SerieViewModel {
  Series? serie;
  Stopwatch chronometer = Stopwatch();
  int currentQuestion = 0;
  Future<Series> getSerie(String id) async {
    return await SerieRepository().findOneById(id);
  }

  void nextQuestionHandler() {
    debugPrint(chronometer.elapsed.inSeconds.toString());
    chronometer.reset();
    currentQuestion++;
    QuestionViewModel.chosenOption = null;
  }
}
