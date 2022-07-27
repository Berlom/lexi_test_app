import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/parametre.config.dart';
import '../repository/serie_test_repository.dart';
import '../models/advanced_tile.dart';
import '../models/serie_model.dart';

class SerieViewModel {
  List<Serie> series = [];
  Set<String?> themes = {};
  List<AdvancedTile> advancedTile = [];

  Future<void> getSeries() async {
    series = await SerieRepository().findAll();
    themes = getThemes(series);
    debugPrint(themes.toString());
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

  Set<String?> getThemes(List<Serie> series) {
    Set<String?> reponse = {};
    for (var serie in series) {
      reponse.add(serie.series?.theme);
    }
    return reponse;
  }

  List<String?> getSeriesOfThemes(String? theme) {
    List<String?> response = [];
    for (var serie in series) {
      if (serie.series?.theme == theme) {
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
        title: ParameterConfig["arabicTheme"][theme] ?? "",
        tiles: series,
        icon: ParameterConfig["themeIcons"][theme]);
  }
}
