// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../config/parametre.config.dart';
import '../models/condidate_model.dart';
import '../vm/condidate_view_model.dart';

class DatatableWidget4 extends StatefulWidget {
  const DatatableWidget4({Key? key}) : super(key: key);

  @override
  State<DatatableWidget4> createState() => _DatatableWidget4State();
}

class _DatatableWidget4State extends State<DatatableWidget4> {
  CondidateViewModel condidateViewModel = CondidateViewModel();
  CondidateModel? condidate;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    condidateViewModel.condidate = await condidateViewModel.getCondidate();
    // setState(() {
    //   condidateViewModel.condidate = condidateViewModel.getAppointmentsType();
    // })

    // await condidateViewModel.getCondidate();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder<CondidateModel>(
            future: condidateViewModel.getCondidate(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                // debugPrint(condidateViewModel
                //     .historiqueElements(snapshot.data!.appointments, 1)
                //     .toString());
                return DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Moniteur',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Date',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Heure ',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Type',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Statut',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Prix',
                            style: Theme.of(context).textTheme.bodyText2)),
                  ],
                  rows: condidateViewModel
                      .examsElements(snapshot.data!
                          .exams) // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                        ((element) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(element.monitor.toString(),
                                    style: TextStyle(
                                        fontSize:
                                            15))), //Extracting from Map element the value
                                DataCell(Text(
                                    element.examDate!.substring(0, 10),
                                    style: TextStyle(fontSize: 15))),
                                DataCell(Text(element.examTime!,
                                    style: TextStyle(fontSize: 15))),
                                DataCell(Text(
                                    ParameterConfig["type"][element.type],
                                    style: TextStyle(fontSize: 15))),
                                DataCell(Text(
                                    (ParameterConfig["examStatus"]
                                        [element.status]),
                                    style: TextStyle(fontSize: 15))),
                                DataCell(Text(
                                    element.candidateAmount!.toString(),
                                    style: TextStyle(fontSize: 15))),
                              ],
                            )),
                      )
                      .toList(),
                );
              }
            }),
      ),
    );
  }
}
