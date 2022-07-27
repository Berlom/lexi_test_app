// ignore_for_file: prefer_final_fields, unused_field, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

import '../models/user_model.dart';
import '../repository/user_repository.dart';
import '../utils.dart';
import '../views/home_page_view.dart';

class LoginViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void checkLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Utils.displaySnackBar(context, "error", "Erreur dans la formulaire");
      return;
    }
    UserModel user = UserModel(
        username: loginController.text, password: passwordController.text);
    Response response = await UserRepository().loginCheck(user);
    if (response.statusCode != 200) {
      Utils.displaySnackBar(context, "error",
          "Votre identifiant ou votre mot de passe est invalide");
      return;
    }
    await SessionManager().set("user", response.body);
    await SessionManager().set("token", jsonDecode(response.body)["token"]);
    Utils.displaySnackBar(context, "valid", "Bienvenu");
    Utils.navigateTo(context, HomePage());
  }

  String? loginValidator(String? value) {
    // if (value == null ||
    //     !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //         .hasMatch(value)) {
    //   return "input must be mail";
    // }
    return null;
  }

  String? passwordValidator(String? val) {
    if (val == null || val.length < 8) {
      return "Mot de passe doit être plus long que 8";
    }
    return null;
  }
}
