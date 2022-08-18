// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../components/custom_appbar_view.dart';
import '../components/drawer_user.dart';
import '../components/footer.dart';
import '../models/condidate_model.dart';
import '../social_ icons.dart';
import '../vm/condidate_view_model.dart';
import 'code_en_ligne_user_view.dart';

class CourView extends StatelessWidget {
  CondidateViewModel condidateViewModel = CondidateViewModel();
  CondidateModel? condidate;
  CourView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroudColor: Colors.lightBlue,
          title: 'Cours',
        ),
        drawer: AppDrawer(),
        body: buildBody());
  }

  Widget buildBody() {
    return FutureBuilder<CondidateModel>(
        future: condidateViewModel.getCondidate(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 35),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text("Cours",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: SizedBox(
                                    child: Text(
                                      "Bientôt disponible",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 40),

                            // SizedBox(
                            //   height: 555,
                            //   child: HistoryDataTable(),
                            // ),
                          ]),
                    ),
                  ),
                  SizedBox(height: 30),
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
                    child: Text("< Retour"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.45),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularIcon(icon: Icons.facebook),
                            CircularIcon(icon: SocialIcons.instagram),
                            CircularIcon(icon: SocialIcons.youtube_play),
                          ]),
                      SizedBox(height: 30),
                      Text(
                        "© 2022-2019 TOUS DROITS RESERVES LEXI",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }
}
