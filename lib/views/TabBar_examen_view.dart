// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/listView_examen.dart';
import '../components/listView_examen2.dart';

class TabBarExamenView extends StatefulWidget {
  const TabBarExamenView({Key? key}) : super(key: key);

  @override
  State<TabBarExamenView> createState() => _TabBarExamenViewState();
}

class _TabBarExamenViewState extends State<TabBarExamenView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 20),
        getTabBar(),
        Divider(),
        gettabbarPages()
      ]),
    );
  }

  Widget getTabBar() {
    return TabBar(
        indicatorColor: Colors.blue,
        controller: tabController,
        tabs: [
          Tab(
            child: Text("Tous les examens",
                style: Theme.of(context).textTheme.bodyText2),
          ),
          Tab(
            child: Text("Examen aléatoire",
                style: Theme.of(context).textTheme.bodyText2),
          )
        ]);
  }

  Widget gettabbarPages() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [ListViewExamen(), ListViewExamen2()],
      ),
    );
  }
}
