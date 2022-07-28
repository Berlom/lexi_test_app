import 'question_model.dart';

class Serie {
  String? id;
  Series? series;

  Serie({id, series});

  Serie.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? theme;
  String? category;
  List<Question>? questions;

  Series({id, name, type, theme, category, questions});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    theme = json['theme'];
    category = json['category'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['theme'] = theme;
    data['category'] = category;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
