import 'dart:async';
import '../models/code_solde_model.dart';
import '../repository/code_solde_repository.dart';
import '../repository/examen_repository.dart';
import '/models/examen_model.dart';

import '../config/parametre.config.dart';
import '../models/advanced_tile.dart';

class ExamenViewModel {
  List<ExamenModel> series = [];
  Set<String?> themes = {};
  List<AdvancedTile> advancedTile = [];

  Future<void> getSeries() async {
    series = await ExamenRepository().findAll();
    themes = await getThemes(series);
    //debugPrint(examen.toString());
  }

  Future<String> getCategory() async {
    CodeSoldeModel codeSolde = await CodeSoldeRepository().findAll();
    String userCategory = codeSolde.category!;
    return userCategory;
  }

  List<AdvancedTile> getTiles() {
    List<AdvancedTile> tiles = [];
    for (var theme in themes) {
      if (getTile(theme.toString()).title.isNotEmpty) {
        tiles.add(getTile(theme.toString()));
      }
    }
    return tiles;
  }

  Future<Set<String?>> getThemes(List<ExamenModel> series) async {
    Set<String?> reponse = {};
    String userCategory = await getCategory();
    //category.then((value) {});
    // debugPrint(category);

    for (var serie in series) {
      //var data = serie.series!.category;
      //var add = reponse.add(serie.series?.category);
      //var compare = data!.compareTo('b');
      //String valeur;
      if (serie.series!.category == userCategory) {
        //debugPrint(compare.toString());
        //debugPrint("$data $valeur");
        reponse.add(serie.series?.category);
      }
    }

    return reponse;
  }

  List<String?> getSeriesOfThemes(String? theme) {
    List<String?> response = [];
    for (var serie in series) {
      if (serie.series?.category == theme) {
        response.add(serie.series?.name);
      }
    }
    return response;
  }

  AdvancedTile getTile(String theme) {
    List<AdvancedTile> series = [];

    for (var serie in getSeriesOfThemes(theme)) {
      series.add(AdvancedTile(title: serie.toString()));
    }
    return AdvancedTile(
      title: ParameterConfig["category"][theme] ?? "",
      tiles: series,
    );
  }
}
