// ignore_for_file: prefer_const_constructors, non_constant_identifier_names



import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../vm/condidate_view_model.dart';
import '/models/condidate_model.dart';

import '../components/custom_appbar_view.dart';

import '../components/drawer_user.dart';
import '../components/list_view_item.dart';
import '../components/profil_info_widget.dart';
import '../models/condidate_model.dart';
import 'profil_historique_des_avances_view.dart';
import 'profil_historique_des_seances_de_code_view.dart';
import 'profil_historique_des_seances_de_counduite_view.dart';
import 'profil_historiques_des_examens_view.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  CondidateViewModel condidateViewModel = CondidateViewModel();
  CondidateModel? condidate;

  @override
  void initState() {

    super.initState();
    // debugPrint(
    //     condidateViewModel!.condidate!.appointments![1].session.toString());
    // init();
  }

  void init() async {
    condidateViewModel.condidate = await condidateViewModel.getCondidate();
    // setState(() {
    //   condidateViewModel.condidate = condidateViewModel.getAppointmentsType();
    // })

    // await condidateViewModel.getCondidate();

    // debugPrint(await Appointments!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroudColor: Colors.lightBlue,
          title: 'Lexi',
        ),
        drawer: AppDrawer(),
        body: FutureBuilder<CondidateModel>(
          future: condidateViewModel.getCondidate(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    MonProfil(context),
                    ProfilInfoWidget(
                      title: 'Séance de code',
                      info1: condidateViewModel.appointments(
                          snapshot.data!.appointments, 1, "realise"),
                      info2: "Réalisée",
                      info3: condidateViewModel.appointments(
                          snapshot.data!.appointments, 1, "planifie"),
                      info4: "Planifier",
                      info5:
                          snapshot.data!.accomplishedCodeAppointment.toString(),
                      width: 80,
                      info5Color: Color.fromARGB(255, 19, 188, 175),
                      info3Color: Color.fromARGB(255, 19, 188, 175),
                      fontWeight: FontWeight.normal,
                    ),
                    ProfilInfoWidget(
                      title: 'Séance de conduite',
                      info1: condidateViewModel.appointments(
                          snapshot.data!.appointments, 2, "realise"),
                      info2: "Réalisée",
                      info3: condidateViewModel.appointments(
                          snapshot.data!.appointments, 2, "planifie"),
                      info4: "Planifier",
                      info5: snapshot.data!.accomplishedDrivingAppointment
                          .toString(),
                      width: 47,
                      info5Color: Color.fromARGB(255, 19, 188, 175),
                      info3Color: Color.fromARGB(255, 19, 188, 175),
                      fontWeight: FontWeight.normal,
                    ),
                    ProfilInfoWidget(
                      title: 'Nombre d\'examen',
                      info1: condidateViewModel.exams(snapshot.data!.exams, 1),
                      info2: "Code",
                      info3: condidateViewModel.exams(snapshot.data!.exams, 2),
                      info4: "Conduit",
                      info5:
                          condidateViewModel.totalExams(snapshot.data!.exams),
                      width: 67,
                      info5Color: Color.fromARGB(255, 19, 188, 175),
                      info3Color: Color.fromARGB(255, 19, 188, 175),
                      fontWeight: FontWeight.normal,
                    ),
                    ProfilInfoWidget(
                      title: 'Séance code en ligne',
                      info1: condidateViewModel
                          .intToTimeLeft(snapshot.data!.timeConsumed),
                      info2: "Réalisée",
                      info3: condidateViewModel
                          .intToTimeLeft(snapshot.data!.codeSold),
                      info4: "Solde Candidat",
                      info5: '',
                      width: 30,
                      info5Color: Colors.grey.withOpacity(0),
                      info3Color: Color.fromARGB(255, 19, 188, 175),
                      fontWeight: FontWeight.bold,
                    ),
                    ProfilInfoWidget(
                      title: 'Prix total',
                      info1: snapshot.data!.paidAmount.toString(),
                      info2: "Montant Payé",
                      info3: snapshot.data!.amountToPay.toString(),
                      info4: "Reste à payer",
                      info5: condidateViewModel.getTotalPrice(
                          snapshot.data!.paidAmount,
                          snapshot.data!.amountToPay),
                      width: 40,
                      info5Color: Color.fromARGB(255, 19, 188, 175),
                      info3Color: Colors.redAccent.shade700,
                      fontWeight: FontWeight.normal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Reste à payer = Montant Payé - (Prix des séances faites + prix de tous les examens + prix des forfaits ) Prix total = Prix de tous les séances + prix de tous les examens + prix des forfaits",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    historique(context),
                  ],
                ),
              );
            }
          },
        ));
  }

  Widget MonProfil(BuildContext context) {
    return FutureBuilder<CondidateModel>(
        future: condidateViewModel.getCondidate(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
                child: ScreenUtilInit(
              // designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.grey),
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Mon profil",
                          style: TextStyle(fontSize: 21),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/logo1.png"),
                            radius: 90,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text("Date d'ajout : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(
                                snapshot.data!.createdAt
                                    .toString()
                                    .substring(0, 10),
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Pièce d'identité : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(snapshot.data!.account!.username.toString(),
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Téléphone : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(snapshot.data!.phone.toString(),
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Catégorie : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(
                                snapshot.data!.category
                                    .toString()
                                    .toUpperCase(),
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Prix séance de conduite : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(snapshot.data!.drivingPrice.toString(),
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(" DT",
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Prix séance de code : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(snapshot.data!.codePrice.toString(),
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(" DT",
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Prix examen de conduite : ",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(snapshot.data!.drivingExamPrice.toString(),
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(" DT",
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Prix examen de code :",
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(snapshot.data!.codeExamPrice.toString(),
                                style: Theme.of(context).textTheme.bodyText1),
                            Text(" DT",
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        SizedBox(height: 30),
                      ]),
                );
              },
            ));
          }
        });
  }

  Widget historique(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.grey),
          //color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        ListViewItem(
          title: "Historiques des avances",
          onTap: () {},
          dataTable: DatatableWidget1(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Divider(
            height: 0,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        ListViewItem(
          title: "Historiques des séances de code",
          onTap: () {},
          dataTable: DatatableWidget2(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Divider(
            height: 0,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        ListViewItem(
          title: "Historiques des séances de conduite",
          onTap: () {},
          dataTable: DatatableWidget3(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Divider(
            height: 0,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        ListViewItem(
          title: "Historiques des examens(code & conduit)",
          onTap: () {},
          dataTable: DatatableWidget4(),
        )
      ]),
    );
  }
}
