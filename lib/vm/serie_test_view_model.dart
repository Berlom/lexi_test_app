import '../config/parametre.config.dart';
import '../models/code_solde_model.dart';
import '../repository/code_solde_repository.dart';
import '../repository/serie_test_repository.dart';
import '../models/advanced_tile.dart';
import '../models/serie_model.dart';

class SerieViewModel {
  List<Serie> series = [];
  Set<String?> themes = {};
  List<AdvancedTile> advancedTile = [];
  String userCategory = "";

  Future<void> getSeries() async {
    series = await SerieRepository().findAll();
    userCategory = await getCategory();
    themes = getThemes(series);
  }

  Future<String> getCategory() async {
    CodeSoldeModel codeSolde = await CodeSoldeRepository().findAll();
    String userCategory = codeSolde.category!;
    return userCategory;
  }

  List<AdvancedTile> getTiles() {
    List<AdvancedTile> tiles = [];
    for (var theme in themes) {
      if (getTile(theme.toString(), userCategory).title.isNotEmpty) {
        tiles.add(getTile(theme.toString(), userCategory));
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

  List<Serie?> getSeriesOfThemes(String? theme) {
    List<Serie?> response = [];
    for (var serie in series) {
      if (serie.series?.theme == theme) {
        response.add(serie);
      }
    }
    return response;
  }

  AdvancedTile getTile(String theme, String userCategory) {
    List<AdvancedTile> series = [];
    for (var serie in getSeriesOfThemes(theme)) {
      series.add(AdvancedTile(
          title: serie!.series!.name.toString(), id: serie.series!.id));
    }
    switch (userCategory) {
      case "a":
        return AdvancedTile(
            title: ParameterConfig["arabicThemeCatA"][theme] ?? "",
            tiles: series,
            icon: ParameterConfig["themeIcons"][theme]);
      case "b":
        return AdvancedTile(
            title: ParameterConfig["arabicThemeCatB"][theme] ?? "",
            tiles: series,
            icon: ParameterConfig["themeIcons"][theme]);
      case "c":
        return AdvancedTile(
            title: ParameterConfig["arabicThemeCatC"][theme] ?? "",
            tiles: series,
            icon: ParameterConfig["themeIcons"][theme]);
      case "c+e":
        return AdvancedTile(
            title: ParameterConfig["arabicThemeCatCE"][theme] ?? "",
            tiles: series,
            icon: ParameterConfig["themeIcons"][theme]);
      case "d":
        return AdvancedTile(
            title: ParameterConfig["arabicThemeCatD"][theme] ?? "",
            tiles: series,
            icon: ParameterConfig["themeIcons"][theme]);
      case "d1":
        return AdvancedTile(
            title: ParameterConfig["arabicThemeCatD1"][theme] ?? "",
            tiles: series,
            icon: ParameterConfig["themeIcons"][theme]);

      default:
    }
    return AdvancedTile(
        title: ParameterConfig["arabicTheme"][theme] ?? "",
        tiles: series,
        icon: ParameterConfig["themeIcons"][theme]);
  }
}
