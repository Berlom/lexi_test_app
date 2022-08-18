// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


import '../models/condidate_model.dart';
import '../vm/condidate_view_model.dart';

class DatatableWidget1 extends StatefulWidget {
  const DatatableWidget1({Key? key}) : super(key: key);

  @override
  State<DatatableWidget1> createState() => _DatatableWidget1State();
}

class _DatatableWidget1State extends State<DatatableWidget1> {
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
                        label: Text('Date',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Ajouté par',
                            style: Theme.of(context).textTheme.bodyText2)),
                    DataColumn(
                        label: Text('Montant ',
                            style: Theme.of(context).textTheme.bodyText2)),
                  ],
                  rows: snapshot.data!
                      .amounts! // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                        ((element) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                    element.amountDate
                                        .toString()
                                        .substring(0, 10),
                                    style: TextStyle(
                                        fontSize:
                                            15))), //Extracting from Map element the value
                                DataCell(Text(
                                    "${element.createdBy!.fullName!} modifier le ${element.createdAt!.substring(0, 10)}",
                                    style: TextStyle(fontSize: 15))),
                                DataCell(Text(element.amount!.toString(),
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
