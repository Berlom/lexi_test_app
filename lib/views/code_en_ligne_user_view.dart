// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lexi_mobile/social_%20icons.dart';
import '../color.dart';
import '../components/code_en_ligne_user_tiles.dart';
import '../components/custom_appbar_view.dart';
import '../components/drawer_user.dart';
import '../components/footer.dart';
import '../globals.dart';
import 'cour_view.dart';
import 'examens_blancs_view.dart';
import 'historique_view.dart';
import 'test_view.dart';

class CodeEnLigneUserView extends StatelessWidget {
  CodeEnLigneUserView({
    Key? key,
  }) : super(key: key);

  List<Widget> route = [
    CourView(),
    TestView(),
    ExamensBlancsView(),
    HistoriqueView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroudColor: Colors.lightBlue,
        title: 'Code en ligne',
      ),
      drawer: AppDrawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
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
                // color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text("Plan de formation",
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
                              style: TextStyle(fontSize: 15, color: textColor),
                            ),
                            Text("4H:51",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: textColor)),
                            Text(" de code en ligne.",
                                style:
                                    TextStyle(fontSize: 15, color: textColor))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    Divider(),
                    SizedBox(
                      child: getLessons(),
                      height: 490,
                    ),
                    SizedBox(height: 20),
                  ]),
            ),
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
          )
        ],
      ),
    );
  }

  Widget getLessons() {
    return ListView.builder(
        primary: false,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: CodeEnLigneUserTiles(data: Globals.courses[index]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => route[index])));
              });
        });
  }
}
