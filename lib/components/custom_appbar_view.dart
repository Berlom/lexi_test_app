// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../utils.dart';
import '../views/login_view.dart';

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
        IconButton(
            icon: Icon(Icons.account_box_rounded),
            onPressed: () async {
              await SessionManager().destroy();
              Utils.navigateTo(context, LoginView());
            })
      ],

      //title: Image.asset('assets/images/logo.jpg', fit: BoxFit.fill),
    );
  }
}
