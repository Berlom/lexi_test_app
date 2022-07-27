import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api.config.dart';
import '../models/school_model.dart';

class SchoolRepository {
  Future<List<SchoolModel>> findAll() async {
    List<SchoolModel> schools = [];
    var jsonResponse = await http.get(Uri.https(
        apiConfig["baseUrl"], "${apiConfig["uri"]}/schools-annuaire"));
    var response = json.decode(jsonResponse.body);
    for (var school in response) {
      schools.add(SchoolModel.fromJson(school));
    }
    return schools;
  }

  Future<SchoolModel> findOneById(String? id) async {
    SchoolModel school;
    var jsonResponse = await http.get(Uri.https(
        apiConfig["baseUrl"], "${apiConfig["uri"]}/schools-annuaire/$id"));
    var response = json.decode(jsonResponse.body);
    school = SchoolModel.fromJson(response);
    return school;
  }
}
