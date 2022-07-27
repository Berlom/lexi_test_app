// ignore_for_file: prefer_const_constructors, must_be_immutable, implementation_imports

import 'package:flutter/material.dart';

import '../globals.dart';
import '../main.dart';
import '../utils.dart';
import '../vm/annuaire_view_model.dart';

class AnnuaireDrawer extends StatelessWidget {
  AnnuaireDrawer({Key? key}) : super(key: key);
  AnnuaireViewModel annuaireViewModel = AnnuaireViewModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              itemCount: annuaireViewModel.drawerItems.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) => ListTile(
                    title: Center(
                        child: TextButton(
                      onPressed: () {
                        Utils.navigateTo(
                            context, annuaireViewModel.drawerItems[index].path);
                      },
                      child: Text(
                        annuaireViewModel.drawerItems[index].name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    )),
                  )),
            ),
            Switch(
                value: MyApp.themeNotifier.value == Globals.darkMode,
                onChanged: (value) {
                  MyApp.themeNotifier.value == Globals.lightMode
                      ? MyApp.themeNotifier.value = Globals.darkMode
                      : MyApp.themeNotifier.value = Globals.lightMode;
                })
          ],
        ),
      ),
    );
  }
}
