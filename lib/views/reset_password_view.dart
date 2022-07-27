// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:flutter/material.dart';

import '../components/annuaire_appbar.dart';
import '../components/annuaire_drawer.dart';
import '../components/footer.dart';
import '../utils.dart';
import '../vm/reset_password_view_model.dart';
import 'login_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordViewModel resetPasswordVM = ResetPasswordViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnnuaireAppbar(),
      resizeToAvoidBottomInset: true,
      drawer: AnnuaireDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
            child: Form(
          key: resetPasswordVM.formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Mot de passe oublié",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: TextFormField(
                  controller: resetPasswordVM.emailController,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: 300.0),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                      label: Center(
                        child: Text(
                          "E-mail",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Color.fromARGB(255, 90, 177, 248)),
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 90, 177, 248),
                          fontSize: 20.0),
                      border: UnderlineInputBorder()),
                  validator: (value) {
                    return resetPasswordVM.emailValidator(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
                  height: 50.0,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      resetPasswordVM.sendResetRequest(context);
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
                      "Envoyer demande",
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
                    "Retourner vers Login",
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
