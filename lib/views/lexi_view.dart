// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../utils.dart';
import '../vm/lexi_view_model.dart';
import 'login_view.dart';
import 'register_view.dart';

class LexiView extends StatelessWidget {
  LexiView({Key? key}) : super(key: key);
  LexiViewModel lexiViewModel = LexiViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(lexiViewModel.backgroundImage),
                  fit: BoxFit.cover)),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 61, 108).withOpacity(0.8),
            Color.fromARGB(255, 90, 177, 248).withOpacity(0.8)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage(lexiViewModel.logo)),
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  lexiViewModel.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 15.0, height: 2.0, color: Colors.white),
                ),
                SizedBox(height: 50.0),
                Container(
                  constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50.0)))),
                    child: Text(
                      "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
                  height: 50.0,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Utils.navigateTo(context, RegisterView());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50.0)))),
                    child: Text(
                      "REGISTER",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Color.fromARGB(255, 90, 177, 248)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
