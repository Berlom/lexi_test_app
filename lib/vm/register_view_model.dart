// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../globals.dart';
import '../models/school_model.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';
import '../utils.dart';
import '../views/login_view.dart';

class RegisterViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController etablissementController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController codeParinageController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numTelController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatedPasswordController = TextEditingController();
  TextEditingController loginController = TextEditingController(text: "Login");
  TextEditingController idController =
      TextEditingController(text: "Identifiant (Exemple: 01/001)");
  bool isIdReadOnly = true;
  String gouvernoratDropDown = "Gouvernorat*";

  String? etablissementValidator(value) {
    if (value == null) {
      return "Le nom d'etablissement ne doit pas être vide";
    }
    return null;
  }

  String? adresseValidator(value) {
    if (value == null) {
      return "L'adresse ne doit pas être vide";
    }
    return null;
  }

  String? idValidator(value) {
    if (value == null || !RegExp(r'^\d\d/\d\d\d$').hasMatch(value)) {
      return "ID invalide";
    }
    return null;
  }

  String? codeParinageValidator(value) {
    if (value == null || !RegExp(r'^\d\d/\d\d\d$').hasMatch(value)) {
      return "Code parinage invalide";
    }
    return null;
  }

  String? nomValidator(value) {
    if (value == null) {
      return "nom invalide";
    }
    return null;
  }

  String? prenomValidator(value) {
    if (value == null) {
      return "prenom invalide";
    }
    return null;
  }

  String? emailValidator(value) {
    if (value == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return "email invalide";
    }
    return null;
  }

  String? numTelValidator(value) {
    if (value == null ||
        !RegExp(r'^[0-9]+$').hasMatch(value) ||
        value.length != 8) {
      return "numero de telephone invalide";
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value == null || value.length < 8) {
      return "mot de passe invalide";
    }
    return null;
  }

  Future<void> checkRegister(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Utils.displaySnackBar(context, "error", "Erreur dans la formulaire");
      return;
    }
    if (passwordController.text != repeatedPasswordController.text) {
      Utils.displaySnackBar(
          context, "error", "Les mots de passe ne correspondent pas");
      return;
    }
    //create a user model and adding user to database
    SchoolModel school = SchoolModel(
        name: etablissementController.text,
        address: adresseController.text,
        city: [Globals.gouvNumber[gouvernoratDropDown].toString()],
        schoolNumber: idController.text,
        referredBy: codeParinageController.text,
        schoolTel: numTelController.text);
    UserModel user = UserModel(
        firstname: prenomController.text,
        lastname: nomController.text,
        email: emailController.text,
        username: idController.text,
        password: passwordController.text,
        phone: numTelController.text,
        school: school);
    Response response = await UserRepository().registerRequest(user);
    if (response.statusCode != 200) {
      Utils.displaySnackBar(context, "error",
          "Votre identifiant ou votre mot de passe est invalide");
      return;
    }
    Utils.displaySnackBar(context, "valid", "Utilisateur ajouté avec succés");
    Utils.navigateTo(context, LoginView());
  }
}
