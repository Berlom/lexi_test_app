import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import '/models/examen_model.dart';

class ExamenRepository {
  Future<List<ExamenModel>> findAll() async {
    List<ExamenModel> examens = [];
    var user = await SessionManager().get("user");
    var jsonResponse = await get(
        Uri.https("preprod.lexi.tn", "ds_backend/public/api/v1/exam/series"),
        headers: {'Authorization': 'Bearer ${user["token"].toString()} '});
    var response = jsonDecode(jsonResponse.body);
    for (var examen in response) {
      examens.add(ExamenModel.fromJson(examen));
    }

    return examens;
  }
}
