import 'school_model.dart';

class UserModel {
  String? username;
  String? password;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  SchoolModel? school;

  UserModel({
    this.username,
    this.password,
    this.school,
    this.email,
    this.firstname,
    this.lastname,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstName'];
    lastname = json['lastName'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
    school =
        json['school'] != null ? SchoolModel.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstname;
    data['lastName'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['phone'] = phone;
    if (school != null) {
      data['school'] = school!.toJson();
    }
    return data;
  }
}
