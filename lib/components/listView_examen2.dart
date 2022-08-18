// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../views/code_en_ligne_user_view.dart';

class ListViewExamen2 extends StatefulWidget {
  const ListViewExamen2({Key? key}) : super(key: key);

  @override
  State<ListViewExamen2> createState() => _ListViewExamen2State();
}

class _ListViewExamen2State extends State<ListViewExamen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CodeEnLigneUserView()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Color.fromARGB(255, 19, 188, 175),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text("Examen en arabe"),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CodeEnLigneUserView()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Color.fromARGB(255, 19, 188, 175),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text("Examen en francais"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
