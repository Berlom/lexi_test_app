// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable

import 'package:flutter/cupertino.dart';

import '../models/serie_model.dart';
import '../repository/serie_test_repository.dart';
import '../repository/user_repository.dart';
import '../utils.dart';
import '../views/test_view.dart';
import 'question_view_model.dart';

class SerieViewModel {
  Series? serie;
  Stopwatch chronometer = Stopwatch();
  int currentQuestion = 1;
  int codeSold = 0;
  UserRepository userRepository = UserRepository();
  Future<Series> getSerie(String id) async {
    return await SerieRepository().findOneById(id);
  }

  void getSolde() async {
    codeSold = await userRepository.getUserCurrentSolde();
  }

  void nextQuestionHandler(int serieLength, BuildContext context) async {
    if (serieLength <= currentQuestion) {
      //display the result
      Utils.navigateTo(context, TestView());
    } else {
      currentQuestion++;
      int consumed = chronometer.elapsed.inSeconds;
      codeSold -= chronometer.elapsed.inSeconds;
      // await userRepository.updateCodeSolde(codeSold, consumed);
      chronometer.reset();
      QuestionViewModel.chosenOption = null;
    }
  }

  void correctionHandler(BuildContext context) {
    Utils.displaySnackBar(
        context, "valid", QuestionViewModel.currentQuestionAnswer.toString());
  }
}
