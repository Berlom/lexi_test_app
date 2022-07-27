import 'dart:convert';

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
}
