// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '/vm/history_view_model.dart';

import '../models/history_model.dart';

class HistoryDataTable extends StatefulWidget {
  const HistoryDataTable({Key? key}) : super(key: key);

  @override
  State<HistoryDataTable> createState() => _HistoryDataTableState();
}

class _HistoryDataTableState extends State<HistoryDataTable> {
  HistoryViewModel historyViewModel = HistoryViewModel();
  HistoryModel? historyModel;

  get historyy => historyViewModel.getHistory();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder<List<HistoryModel>>(
          future: historyViewModel.getHistory(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              // debugPrint(condidateViewModel
              //     .historiqueElements(snapshot.data!.appointments, 1)
              //     .toString());
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Nom du serie",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.blue))),
                      //onChanged: searchName,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      // ignore: prefer_const_literals_to_create_immutables
                      columns: [
                        DataColumn(label: Text('Score',style: Theme.of(context).textTheme.button)),
                        DataColumn(label: Text('Nom',style: Theme.of(context).textTheme.button)),
                        DataColumn(label: Text('Date',style: Theme.of(context).textTheme.button)),
                      ],
                      rows: snapshot.data!
                          .map(
                            ((element) => DataRow(
                                  cells: <DataCell>[
                                    //Extracting from Map element the value

                                    DataCell(Text(
                                        "${element.score}/${element.nbQuestions}")),
                                    DataCell(
                                        Text(element.seriesName.toString())),
                                    DataCell(
                                      Text(
                                          "il ya ${historyViewModel.date(element.updatedAt!.date.toString())} jours"),
                                    )
                                  ],
                                )),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }

  // void searchName(String query) {
  //   final suggstions = historyy.where((history) {
  //     final name = history;
  //     final input = query.toLowerCase();
  //     return name.contains(input);
  //   }).toList();
  //   setState(() =>  names=suggstions;

  //   );
  // }
}
