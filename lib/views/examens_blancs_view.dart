// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/custom_appbar_view.dart';
import '../components/drawer_user.dart';
import 'code_en_ligne_user_view.dart';

class ExamensBlancsView extends StatelessWidget {
  const ExamensBlancsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroudColor: Colors.lightBlue,
          title: 'Examens Blancs',
        ),
        drawer: AppDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Examens Blancs"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CodeEnLigneUserView()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Colors.grey.shade700,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: Text("< Retour")),
              ],
            )));
  }
}
