// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../config/api.config.dart';
import '../models/user_model.dart';

class UserRepository {
  Future<http.Response> loginCheck(UserModel user) async {
    var response = await http.post(
        Uri.https(apiConfig["baseUrl"], "/ds_backend/public/login_check"),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(user.toJson()));
    return response;
  }

  Future<http.Response> registerRequest(UserModel user) async {
    var response = await http.post(
        Uri.https(apiConfig["baseUrl"], "${apiConfig["uri"]}/users/register"),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(user.toJson()));
    return response;
  }

  Future<http.Response> resetRequest(String email) async {
    var response = await http.post(
        Uri.https(apiConfig["baseUrl"],
            "${apiConfig["uri"]}/resetting/request-resetting"),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email}));
    return response;
  }

  Future<int> getUserCurrentSolde() async {
    int solde = 0;
    var user = await SessionManager().get("user");
    var response = await http.get(
        Uri.https(apiConfig["baseUrl"],
            "${apiConfig["uri"]}/candidate/${user["candidateId"]}/code_solde"),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${user["token"]}'
        });
    // solde = jsonDecode(response.body)["code_sold"];
    return solde;
  }

  Future<http.Response> updateCodeSolde(int current, int consumed) async {
    var user = await SessionManager().get("user");
    var response = await http.put(
        Uri.https(apiConfig["baseUrl"],
            "${apiConfig["uri"]}/candidate/codeSold/${user["candidateId"]}"),
        headers: <String, String>{
          'Authorization': 'Bearer ${user["token"]}'
        },
        body: {
          "code_sold": current.toString(),
          "consumed": consumed.toString()
        });
    return response;
  }
}
