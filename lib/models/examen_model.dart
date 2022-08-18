class ExamenModel {
  String? id;
  Series? series;

  ExamenModel({id, series});

  ExamenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (series != null) {
      data['series'] = series!.toJson();
    }
    return data;
  }
}

class Series {
  String? id;
  String? name;
  String? theme;
  String? category;
  String? type;

  Series({this.id, this.name, this.theme, this.category, this.type});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    theme = json['theme'];
    category = json['category'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['theme'] = theme;
    data['category'] = category;
    data['type'] = type;
    return data;
  }
}
