import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import '/models/code_solde_model.dart';

class CodeSoldeRepository {
  Future<CodeSoldeModel> findAll() async {
    CodeSoldeModel codeSoldeModel;
    // List<CodeSoldeModel> codeSolde = [];
    var user = await SessionManager().get("user");
    var jsonResponse = await get(
        Uri.https("preprod.lexi.tn",
            "/ds_backend/public/api/v1/candidate/${user["candidateId"].toString()}/code_solde"),
        headers: {'Authorization': 'Bearer ${user["token"].toString()} '});
    var response = jsonDecode(jsonResponse.body);
    codeSoldeModel = CodeSoldeModel.fromJson(response);
    //String? category = codeSoldeModel.category;
    //debugPrint(codeSoldeModel.category.toString());
    return codeSoldeModel;
  }
}
