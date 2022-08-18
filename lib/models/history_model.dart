// ignore_for_file: prefer_collection_literals

class HistoryModel {
  String? seriesId;
  String? seriesName;
  String? candidateId;
  int? nbQuestions;
  int? score;
  String? candidateSeriesId;
  bool? isView;
  UpdatedAt? updatedAt;

  HistoryModel(history,
      {seriesId,
      seriesName,
      candidateId,
      nbQuestions,
      score,
      candidateSeriesId,
      isView,
      updatedAt});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    candidateId = json['candidateId'];
    nbQuestions = json['nbQuestions'];
    score = json['score'];
    candidateSeriesId = json['candidateSeriesId'];
    isView = json['isView'];
    updatedAt = json['updatedAt'] != null
        ? UpdatedAt.fromJson(json['updatedAt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['seriesId'] = seriesId;
    data['seriesName'] = seriesName;
    data['candidateId'] = candidateId;
    data['nbQuestions'] = nbQuestions;
    data['score'] = score;
    data['candidateSeriesId'] = candidateSeriesId;
    data['isView'] = isView;
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt!.toJson();
    }
    return data;
  }
}

class UpdatedAt {
  String? date;
  int? timezoneType;
  String? timezone;

  UpdatedAt({date, timezoneType, timezone});

  UpdatedAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['timezone_type'] = timezoneType;
    data['timezone'] = timezone;
    return data;
  }
}
