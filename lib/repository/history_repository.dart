import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import '/models/history_model.dart';

class HistoryRepository {
  Future<List<HistoryModel>> findall() async {
    List<HistoryModel> histories = [];
    var user = await SessionManager().get("user");
    var jsonResponse = await get(
        Uri.https("preprod.lexi.tn",
            "/ds_backend/public/api/v1/candidate/${user["candidateId"].toString()}/history"),
        headers: {'Authorization': 'Bearer ${user["token"].toString()} '});
    var response = jsonDecode(jsonResponse.body);
    for (var history in response) {
      histories.add(HistoryModel.fromJson(history));
    }

    return histories;
  }
}
