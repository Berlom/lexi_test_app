// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lexi_mobile/social_%20icons.dart';
import '../components/custom_appbar_view.dart';
import '../components/drawer_user.dart';
import '../components/footer.dart';
import '../components/test_tile_page.dart';
import '../color.dart';
import 'code_en_ligne_user_view.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroudColor: Colors.lightBlue,
          title: 'Test',
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
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
                    color: Colors.white,
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
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
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
                                      TextStyle(fontSize: 15, color: textColor),
                                ),
                                Text("4H:51",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: textColor)),
                                Text(" de code en ligne.",
                                    style: TextStyle(
                                        fontSize: 15, color: textColor))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Divider(),
                        SizedBox(
                          child: TestTilePage(),
                          height: 555,
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
                child: Text("< Retour"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    primary: Colors.grey.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                style: TextStyle(color: labelColor),
              ),
            ],
          ),
        ));
  }
}