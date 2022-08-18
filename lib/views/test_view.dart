// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../components/custom_appbar_view.dart';
import '../components/drawer_user.dart';
import '../components/footer.dart';
import '../components/test_tile_page.dart';

import '../models/condidate_model.dart';
import '../social_ icons.dart';
import '../vm/condidate_view_model.dart';
import 'code_en_ligne_user_view.dart';

class TestView extends StatelessWidget {
  CondidateViewModel condidateViewModel = CondidateViewModel();
  CondidateModel? condidate;
  TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroudColor: Colors.lightBlue,
          title: 'Test',
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
                    margin: EdgeInsets.all(5),
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
                                    Text("Mes Series",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      "Il vous reste ",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      condidateViewModel.intToTimeLeft(
                                          snapshot.data!.codeSold),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(" de code en ligne.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1)
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 25),
                            Divider(),
                            SizedBox(
                              height: 555,
                              child: TestTilePage(),
                            ),
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
                  SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CircularIcon(icon: Icons.facebook),
                    CircularIcon(icon: SocialIcons.instagram),
                    CircularIcon(icon: SocialIcons.youtube_play),
                  ]),
                  SizedBox(height: 30),
                  Text(
                    "© 2022-2019 TOUS DROITS RESERVES LEXI",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 10)
                ],
              ),
            );
          }
        });
  }
}
