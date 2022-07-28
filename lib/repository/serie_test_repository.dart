import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

import '../config/api.config.dart';
import '../models/serie_model.dart';

class SerieRepository {
  Future<List<Serie>> findAll() async {
    List<Serie> series = [];
    String token = await SessionManager().get("token");
    var jsonResponse = await get(
        Uri.https("preprod.lexi.tn", "/ds_backend/public/api/v1/series"),
        headers: {'Authorization': 'Bearer $token'});

    var response = jsonDecode(jsonResponse.body);
    for (var serie in response) {
      series.add(Serie.fromJson(serie));
    }
    return series;
  }

  Future<Series> findOneById(String? id) async {
    Series serie;
    String token = await SessionManager().get("token");
    var jsonResponse = await get(
        Uri.https(apiConfig["baseUrl"], "${apiConfig["uri"]}/series/$id"),
        headers: {'Authorization': 'Bearer $token'});
    var response = json.decode(jsonResponse.body);
    serie = Series.fromJson(response);
    return serie;
  }
}
