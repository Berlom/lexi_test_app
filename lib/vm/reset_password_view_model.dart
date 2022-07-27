// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../repository/user_repository.dart';
import '../utils.dart';

class ResetPasswordViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  String? emailValidator(value) {
    if (value == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return "email invalide";
    }
    return null;
  }

  void sendResetRequest(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Utils.displaySnackBar(context, "error", "Erreur dans la formulaire");
      return;
    }
    Response response =
        await UserRepository().resetRequest(emailController.text);
    if (response.statusCode != 200) {
      Utils.displaySnackBar(context, "error", "Cette email n'exist pas");
      return;
    }
    Utils.displaySnackBar(context, "valid",
        "Vous allez recevoir un courriel pour réinitialiser votre mot de passe.");
  }
}
