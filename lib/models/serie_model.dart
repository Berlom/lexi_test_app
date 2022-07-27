class Serie {
  String? id;
  Series? series;

  Serie({this.id, this.series});

  Serie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    series =
        json['series'] != null ? new Series.fromJson(json['series']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.series != null) {
      data['series'] = this.series!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['theme'] = this.theme;
    data['category'] = this.category;
    data['type'] = this.type;
    return data;
  }
}