import 'package:intl/intl.dart';
import '/models/history_model.dart';

import '../repository/history_repository.dart';

class HistoryViewModel {
  HistoryModel? history;

  Future<List<HistoryModel>> getHistory() async {
    List<HistoryModel> history = await HistoryRepository().findall();
    return history;
  }

  String date(String date) {
    DateTime dateNow = DateTime.now();
    DateTime date1 = DateFormat("yyyy-MM-dd").parse(date.substring(0, 10));
    Duration difference = dateNow.difference(date1);
    String inDays = difference.inDays.toString();

    return inDays;
  }
}
