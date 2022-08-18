// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '/vm/examen_view_model.dart';
import '../models/advanced_tile.dart';
import 'calendar_widget.dart';

class ListViewExamen extends StatefulWidget {
  const ListViewExamen({Key? key}) : super(key: key);

  @override
  State<ListViewExamen> createState() => _ListViewExamenState();
}

class _ListViewExamenState extends State<ListViewExamen> {
  ExamenViewModel examenViewModel = ExamenViewModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await examenViewModel.getSeries();
    setState(() {
      examenViewModel.advancedTile = examenViewModel.getTiles().toList();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionPanelList.radio(
                expansionCallback: (index, isExpanded) {
                  final tile = examenViewModel.advancedTile[index];
                  setState(() => tile.isExpanded = isExpanded);
                },
                children: examenViewModel.advancedTile
                    .map((tile) => ExpansionPanelRadio(
                          value: tile.title,
                          canTapOnHeader: true,
                          headerBuilder: (context, isExpanded) =>
                              buildTile(tile),
                          body: Column(
                            children: tile.tiles.map(buildTile).toList(),
                          ),
                        ))
                    .toList(),
              ),
              expansionPanel()
            ],
          ),
        ),
      );

  Widget buildTile(AdvancedTile tile) => ListTile(
        title: Text(
          tile.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onTap: tile.tiles.isEmpty
            ? () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CalendarWidget())))
                }
            : null,
      );

  Widget expansionPanel() {
    return ExpansionPanelList.radio(
      children: [
        ExpansionPanelRadio(
            canTapOnHeader: true,
            value: "text1",
            headerBuilder: (context, isExpanded) =>
                ListTile(title: Text("Catégorie B fr",style: Theme.of(context).textTheme.bodyText2,)),
            body: ListTile(
              title: Center(child: Text("Bientôt disponible",style: Theme.of(context).textTheme.bodyText2)),
            ))
      ],
    );
  }
}
// ExpansionPanelRadio(
//             canTapOnHeader: true,
//             value: "text1",
//             headerBuilder: (context, isExpanded) =>
//                 ListTile(title: Text("Catégorie B fr")),
//             body: ListTile(
//               title: Center(child: Text("Bientôt disponible")),
//             ))





// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:test_project/vm/examen_view_model.dart';
// import '../models/advanced_tile.dart';
// import 'calendar_widget.dart';

// class ListViewExamen extends StatefulWidget {
//   const ListViewExamen({Key? key}) : super(key: key);

//   @override
//   State<ListViewExamen> createState() => _ListViewExamenState();
// }

// class _ListViewExamenState extends State<ListViewExamen> {
//   ExamenViewModel examenViewModel = ExamenViewModel();

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   void init() async {
//     await examenViewModel.getSeries();
//     setState(() {
//       examenViewModel.advancedTile = examenViewModel.getTiles().toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: SingleChildScrollView(
//           child: ExpansionPanelList.radio(
//             expansionCallback: (index, isExpanded) {
//               final tile = examenViewModel.advancedTile[index];
//               setState(() => tile.isExpanded = isExpanded);
//             },
//             children: examenViewModel.advancedTile
//                 .map((tile) => ExpansionPanelRadio(
//                       value: tile.title,
//                       canTapOnHeader: true,
//                       headerBuilder: (context, isExpanded) => buildTile(tile),
//                       body: Column(
//                         children: tile.tiles.map(buildTile).toList(),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       );

//   Widget buildTile(AdvancedTile tile) => ListTile(
//         title: Text(
//           tile.title,
//           style: Theme.of(context).textTheme.bodyText2,
//         ),
//         onTap: tile.tiles.isEmpty
//             ? () => {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: ((context) => CalendarWidget())))
//                 }
//             : null,
//       );
// }