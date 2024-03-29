// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../views/serie_view.dart';
import '../vm/serie_test_view_model.dart';
import '../models/advanced_tile.dart';

class TestTilePage extends StatefulWidget {
  const TestTilePage({Key? key}) : super(key: key);

  @override
  State<TestTilePage> createState() => _TestTilePageState();
}

class _TestTilePageState extends State<TestTilePage> {
  SerieViewModel serieViewModel = SerieViewModel();
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await serieViewModel.getSeries();
    setState(() {
      serieViewModel.advancedTile = serieViewModel.getTiles().toList();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            expansionCallback: (index, isExpanded) {
              final tile = serieViewModel.advancedTile[index];
              setState(() => tile.isExpanded = isExpanded);

              // Utils.showSnackBar(
              //   context,
              //   text: isExpanded
              //       ? 'Shrink ${tile.title}'
              //       : 'Expand ${tile.title}',
              //   color: Colors.green,
              // );
            },
            children: serieViewModel.advancedTile
                .map((tile) => ExpansionPanelRadio(
                      value: tile.title,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => buildTile(tile),
                      body: Column(
                        children: tile.tiles.map(buildTile).toList(),
                      ),
                    ))
                .toList(),
          ),
        ),
      );

  Widget buildTile(AdvancedTile tile) => ListTile(
        leading: tile.icon != null ? Icon(tile.icon) : null,
        title: Text(
          tile.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onTap: tile.tiles.isEmpty
            ? () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              SerieView(id: tile.id.toString()))))
                }
            : null,
      );
}
