// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'globals.dart';
import 'vm/event_provider_model.dart';
import 'views/annuaire_view.dart';
import 'views/home_page_view.dart';
import 'views/landing_page_view.dart';
import 'views/terms_of_use_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeData> themeNotifier =
      ValueNotifier(Globals.darkMode);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: ValueListenableBuilder<ThemeData>(
        valueListenable: themeNotifier,
        builder: (_, ThemeData current, __) {
          return MaterialApp(
            title: "My First App",
            home: HomePage(),
            theme: current,
          );
        },
      ));
}
