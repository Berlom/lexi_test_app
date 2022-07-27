// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String tileTitle;
  final IconData icon;
  final Function onTap;
  const DrawerTile(
      {Key? key,
      required this.tileTitle,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      iconColor: Colors.white,
      title: Text(tileTitle),
      textColor: Colors.white,
      selectedColor: Colors.red,
      tileColor: Color.fromARGB(255, 10, 161, 146),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50.0, // Change your border radius here
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
