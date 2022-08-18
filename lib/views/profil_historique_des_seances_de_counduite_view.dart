// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


import '../models/condidate_model.dart';
import '../vm/condidate_view_model.dart';

class DatatableWidget3 extends StatefulWidget {
  const DatatableWidget3({Key? key}) : super(key: key);

  @override
  State<DatatableWidget3> createState() => _DatatableWidget3State();
}

class _DatatableWidget3State extends State<DatatableWidget3> {
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
                    DataColumn(label: Text('MONITEUR',style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(label: Text('DATE',style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(label: Text('HEURE DÉBUT',style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(label: Text('HEURE FIN',style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(label: Text('PRIX',style: Theme.of(context).textTheme.bodyText2)),
                  ],
                  rows: condidateViewModel
                      .historiqueElements(snapshot.data!.appointments,
                          2) // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                        ((element) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(element.sender
                                    .toString(),style: TextStyle(
                                        fontSize:
                                            15))), //Extracting from Map element the value
                                DataCell(
                                    Text(element.startedAt!.substring(0, 10),style: TextStyle(
                                        fontSize:
                                            15))),
                                DataCell(Text(element.startedTime!,style: TextStyle(
                                        fontSize:
                                            15))),
                                DataCell(Text(element.endTime!,style: TextStyle(
                                        fontSize:
                                            15))),
                                DataCell(Text((element.session! *
                                        element.candidateAmount!)
                                    .toString(),style: TextStyle(
                                        fontSize:
                                            15))),
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
