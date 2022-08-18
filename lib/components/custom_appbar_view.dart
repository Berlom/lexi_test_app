// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../utils.dart';
import '../views/login_view.dart';
import '../views/profil_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroudColor;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.backgroudColor,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: backgroudColor,
      elevation: 0,
      title: Text(title),
      actions: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        // IconButton(
        //   icon: Icon(Icons.account_box_rounded), onPressed: ()

        //   async {
        //     await SessionManager().destroy();
        //     Utils.navigateTo(context, LoginView());
        //   }
        // )
        PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: FutureBuilder<String>(
                    future: getName(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.toString(),
                            style: Theme.of(context).textTheme.labelLarge);
                      }
                      return CircularProgressIndicator();
                    },
                  )),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(
                            size: 25,
                            Icons.account_box_outlined,
                            color: Theme.of(context).iconTheme.color,
                            //imaryColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Profil",
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 25,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Deconnexion",
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ))
                ])
      ],

      //title: Image.asset('assets/images/logo.jpg', fit: BoxFit.fill),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilView()));
        break;
      case 1:
        deconnexion(context);
    }
  }

  void deconnexion(BuildContext context) async {
    await SessionManager().destroy();
    Utils.navigateTo(context, LoginView());
  }

  Future<String> getName() async {
    var user = await SessionManager().get("user");
    return user["fullName"].toString();
  }
}
