// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../components/drawer_tile.dart';

import '../vm/drawer_view_model.dart';
import '../views/acceuil_view.dart';

import '../views/code_en_ligne_user_view.dart';
import 'calendar_widget.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  DrawerViewModel drawer1 = DrawerViewModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 19, 188, 175),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 188, 175),
              ),
              child: Text(
                drawer1.autoEcoleName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            DrawerTile(
                tileTitle: "ACCEUIL",
                icon: Icons.home,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcceuilView(),
                      ));
                }),
            Divider(),
            DrawerTile(
                tileTitle: "AGENDA",
                icon: Icons.view_agenda,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalendarWidget(),
                      ));
                  //debugPrint("hello");
                }),
            Divider(),
            DrawerTile(
                tileTitle: "CODE EN LIGNE",
                icon: Icons.book_online,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CodeEnLigneUserView(),
                      ));
                  //debugPrint("hello");
                }),
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CodeEnLigneUserView(),
            //       ));
            //   //debugPrint("hello");
            // }),
          ],
        ));
  }
}
