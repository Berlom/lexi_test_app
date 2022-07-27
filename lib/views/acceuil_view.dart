// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/custom_appbar_view.dart';

import '../components/drawer_user.dart';

class AcceuilView extends StatelessWidget {
  const AcceuilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        backgroudColor: Colors.lightBlue,
        title: 'Acceuil',
      ),
      drawer: AppDrawer(),
      body: Center(child: Text('Acceuil Page')),
    );
  }
}
