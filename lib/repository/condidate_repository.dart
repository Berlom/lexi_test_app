import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

import '../models/condidate_model.dart';

class CondidateRepository {
  Future<CondidateModel> findAll() async {
    CondidateModel condidate;
    var user = await SessionManager().get("user");
    var jsonResponse = await get(
        Uri.https("preprod.lexi.tn",
            "/ds_backend/public/api/v1/candidates/${user["candidateId"].toString()}"),
        headers: {'Authorization': 'Bearer ${user["token"].toString()} '});
    var response = jsonDecode(jsonResponse.body);
    condidate = CondidateModel.fromJson(response);

    // for (var condidate in response) {
    //   condidate.add(CondidateModel.fromJson(condidate));
    // }

    return condidate;
  }
}
