// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, use_build_context_synchronously, unused_import

import 'package:flutter/material.dart';

import '../utils.dart';
import '../vm/login_view_model.dart';
import 'register_view.dart';
import 'reset_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  LoginViewModel loginVM = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AnnuaireAppbar(),
      // drawer: AnnuaireDrawer(),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("images/logo.png"),
            SizedBox(
              height: 80,
            ),
            Form(
                key: loginVM.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginInputField(
                        label: "Login",
                        controller: loginVM.loginController,
                        validator: (value) {
                          return loginVM.loginValidator(value);
                        },
                        isPassword: false,
                        inputType: TextInputType.emailAddress,
                        icon: Icons.mail_outline_outlined),
                    SizedBox(
                      height: 25.0,
                    ),
                    LoginInputField(
                        label: "Mot de passe",
                        controller: loginVM.passwordController,
                        validator: (val) {
                          return loginVM.passwordValidator(val);
                        },
                        isPassword: true,
                        inputType: TextInputType.visiblePassword,
                        icon: Icons.lock_person_outlined),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
                      height: 50.0,
                      width: double.infinity,
                      child: TextButton(
                        //check for login
                        onPressed: () {
                          loginVM.checkLogin(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 90, 177, 248)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50.0)))),
                        child: Text(
                          "Se Connecter",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  Utils.navigateTo(context, ResetPasswordView());
                },
                child: Text(
                  "Informations oubliés ?",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Color.fromARGB(255, 90, 177, 248)),
                )),
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pour s'inscrire",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Color.fromARGB(255, 90, 177, 248)),
                ),
                TextButton(
                    onPressed: () {
                      Utils.navigateTo(context, RegisterView());
                    },
                    child: Text(
                      "cliquer ici",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Color.fromARGB(255, 90, 177, 248),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LoginInputField extends StatelessWidget {
  String label;
  FormFieldValidator<String?> validator;
  bool isPassword;
  TextInputType inputType;
  IconData icon;
  TextEditingController controller;
  LoginInputField(
      {Key? key,
      required this.label,
      required this.validator,
      required this.isPassword,
      required this.inputType,
      required this.icon,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color.fromARGB(255, 90, 177, 248),
            size: 30.0,
          ),
          SizedBox(
            width: 20,
          ),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            style: Theme.of(context).textTheme.bodyText1,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              constraints: BoxConstraints(maxWidth: 250.0),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              label: Center(
                  child: Text(
                label,
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
          ),
        ],
      ),
    );
  }
}
