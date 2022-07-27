// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/custom_appbar_view.dart';
import '../components/drawer_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: CustomAppBar(
        backgroudColor: Colors.lightBlue,
        title: 'Lexi',
      ),
      drawer: AppDrawer(),
      body: Center(),
    );
  }
}
