class CodeSoldeModel {
  int? codeSold;
  String? category;
  int? timeConsumed;

  CodeSoldeModel({this.codeSold, this.category, this.timeConsumed});

  CodeSoldeModel.fromJson(Map<String, dynamic> json) {
    codeSold = json['code_sold'];
    category = json['category'];
    timeConsumed = json['time_consumed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code_sold'] = codeSold;
    data['category'] = category;
    data['time_consumed'] = timeConsumed;
    return data;
  }
}
