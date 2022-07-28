import 'serie_model.dart';

class Question {
  String? id;
  Series? series;
  int? number;
  String? type;
  String? response;
  String? category;
  String? difficulty;
  String? value;
  String? questionPicture;
  String? questionAudio;
  String? responsesBody;
  String? lang;

  Question(
      {id,
      series,
      number,
      type,
      response,
      category,
      difficulty,
      value,
      questionPicture,
      questionAudio,
      responsesBody,
      lang});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
    number = json['number'];
    type = json['type'];
    response = json['response'];
    category = json['category'];
    difficulty = json['difficulty'];
    value = json['value'];
    questionPicture = json['questionPicture'];
    questionAudio = json['questionAudio'];
    responsesBody = json['responsesBody'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (series != null) {
      data['series'] = series!.toJson();
    }
    data['number'] = number;
    data['type'] = type;
    data['response'] = response;
    data['category'] = category;
    data['difficulty'] = difficulty;
    data['value'] = value;
    data['questionPicture'] = questionPicture;
    data['questionAudio'] = questionAudio;
    data['responsesBody'] = responsesBody;
    data['lang'] = lang;
    return data;
  }
}
