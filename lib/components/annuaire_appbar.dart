// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../config/parametre.config.dart';

class AnnuaireAppbar extends StatelessWidget with PreferredSizeWidget {
  const AnnuaireAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 57, 189, 179)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Image.asset(ParameterConfig["logo"]));
  }
}
