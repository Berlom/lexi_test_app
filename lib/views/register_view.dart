// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:flutter/material.dart';

import '../components/annuaire_appbar.dart';
import '../components/annuaire_drawer.dart';
import '../components/footer.dart';
import '../globals.dart';
import '../utils.dart';
import '../vm/register_view_model.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterViewModel registerVM = RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnnuaireAppbar(),
      drawer: AnnuaireDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
            child: Form(
          key: registerVM.formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Inscription",
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(
                thickness: 2,
              ),
              Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Informations Auto-école",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          RegisterFormField(
                            label: "Nom de l'établissement",
                            controller: registerVM.etablissementController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return registerVM.etablissementValidator(value);
                            },
                            isPassword: false,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 5),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 300.0),
                              child: DropdownButton<String>(
                                  value: registerVM.gouvernoratDropDown,
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: Color.fromRGBO(89, 173, 241, 1),
                                  ),
                                  isExpanded: true,
                                  underline: Container(
                                    height: 2.0,
                                    color: Color.fromRGBO(89, 173, 241, 1),
                                  ),
                                  items: Utils.getGouvernorat()
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                          "${Globals.gouvNumber[value]} $value",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      registerVM.gouvernoratDropDown = value!;
                                      if (Globals.gouvNumber[value] != "0") {
                                        registerVM.idController.text =
                                            "${Globals.gouvNumber[value]}/";
                                        registerVM.isIdReadOnly = false;
                                      } else {
                                        registerVM.idController.text =
                                            "Identifiant (Exemple: 01/001)";
                                        registerVM.isIdReadOnly = true;
                                      }
                                    });
                                  }),
                            ),
                          ),
                          RegisterFormField(
                            label: "Adresse",
                            controller: registerVM.adresseController,
                            keyboardType: TextInputType.streetAddress,
                            validator: (value) {
                              return registerVM.adresseValidator(value);
                            },
                            isPassword: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              maxLength: 6,
                              controller: registerVM.idController,
                              readOnly: registerVM.isIdReadOnly,
                              style: Theme.of(context).textTheme.bodyText1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(maxWidth: 300.0),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                label: Center(
                                    child: Text(
                                  "identifiant",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: Color.fromARGB(
                                              255, 90, 177, 248)),
                                )),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 90, 177, 248),
                                    fontSize: 20.0),
                                border: UnderlineInputBorder(),
                              ),
                              validator: (value) {
                                return registerVM.idValidator(value);
                              },
                              onChanged: (value) {
                                if (value.length < 3) {
                                  setState(() {
                                    registerVM.idController.text =
                                        "${Globals.gouvNumber[registerVM.gouvernoratDropDown]}/";
                                  });
                                }
                                if (registerVM.idValidator(value) == null) {
                                  registerVM.loginController.text = value;
                                } else {
                                  registerVM.loginController.text = "Login";
                                }
                              },
                            ),
                          ),
                          RegisterFormField(
                            maxlength: 6,
                            label: "Code parinage",
                            controller: registerVM.codeParinageController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return registerVM.codeParinageValidator(value);
                            },
                            isPassword: false,
                          ),
                        ]),
                  )),
              Divider(
                thickness: 2,
              ),
              Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Informations Utilisateur",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          RegisterFormField(
                            label: "Prénom",
                            controller: registerVM.prenomController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return registerVM.prenomValidator(value);
                            },
                            isPassword: false,
                          ),
                          RegisterFormField(
                            label: "Nom",
                            controller: registerVM.nomController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return registerVM.nomValidator(value);
                            },
                            isPassword: false,
                          ),
                          RegisterFormField(
                            label: "Email",
                            controller: registerVM.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return registerVM.emailValidator(value);
                            },
                            isPassword: false,
                          ),
                          RegisterFormField(
                            maxlength: 8,
                            label: "Numero de Téléphone",
                            controller: registerVM.numTelController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return registerVM.numTelValidator(value);
                            },
                            isPassword: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              controller: registerVM.loginController,
                              readOnly: true,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(maxWidth: 300.0),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                label: Center(
                                    child: Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: Color.fromARGB(
                                              255, 90, 177, 248)),
                                )),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 90, 177, 248),
                                    fontSize: 20.0),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                          RegisterFormField(
                              isPassword: true,
                              label: "Mot de passe",
                              controller: registerVM.passwordController,
                              keyboardType: TextInputType.none,
                              validator: (value) {
                                return registerVM.passwordValidator(value);
                              }),
                          RegisterFormField(
                              isPassword: true,
                              label: "Repeter le mot de passe",
                              controller: registerVM.repeatedPasswordController,
                              keyboardType: TextInputType.none,
                              validator: (value) {
                                return registerVM.passwordValidator(value);
                              }),
                        ]),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
                  height: 50.0,
                  width: double.infinity,
                  child: TextButton(
                    //check for signup
                    onPressed: () {
                      registerVM.checkRegister(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 90, 177, 248)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50.0)))),
                    child: Text(
                      "S'inscrire",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: () {
                    Utils.navigateTo(context, LoginView());
                  },
                  child: Text(
                    "Vous avez un compte ?",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Color.fromARGB(255, 90, 177, 248)),
                  )),
              Divider(
                thickness: 2,
              ),
              Footer()
            ],
          ),
        )),
      ),
    );
  }
}

class RegisterFormField extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType keyboardType;
  FormFieldValidator<String?> validator;
  int? maxlength;
  bool isPassword = false;
  RegisterFormField(
      {Key? key,
      required this.label,
      required this.controller,
      required this.keyboardType,
      required this.validator,
      this.maxlength,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: isPassword,
        maxLength: maxlength,
        style: Theme.of(context).textTheme.bodyText1,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          constraints: BoxConstraints(maxWidth: 300.0),
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          label: Center(
              child: Text(
            label,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Color.fromARGB(255, 90, 177, 248)),
          )),
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 90, 177, 248), fontSize: 20.0),
          border: UnderlineInputBorder(),
        ),
        validator: validator,
        onChanged: (value) {
          controller.text = value;
        },
      ),
    );
  }
}
