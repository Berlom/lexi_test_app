// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

import '../components/annuaire_appbar.dart';
import '../components/annuaire_drawer.dart';
import '../components/footer.dart';
import '../config/parametre.config.dart';
import '../globals.dart';
import '../utils.dart';
import '../vm/annuaire_view_model.dart';
import 'school_detail_view.dart';

class Annuaire extends StatefulWidget {
  const Annuaire({Key? key}) : super(key: key);

  @override
  State<Annuaire> createState() => _AnnuaireState();
}

class _AnnuaireState extends State<Annuaire> {
  final AnnuaireViewModel annuaire = AnnuaireViewModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await annuaire.getSchools();
    setState(() {
      annuaire.markers = annuaire.setMarkers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AnnuaireAppbar(),
        resizeToAvoidBottomInset: true,
        drawer: AnnuaireDrawer(),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          children: [
            Center(
                child: Text("Annuaire",
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(height: 20),
            DropdownButton<String>(
                value: annuaire.gouvernoratDropDown,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Color.fromARGB(255, 57, 189, 179),
                ),
                isExpanded: true,
                underline: Container(
                  height: 2.0,
                  color: Color.fromARGB(255, 57, 189, 179),
                ),
                items: Utils.getGouvernorat()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: Theme.of(context).textTheme.labelMedium),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    annuaire.gouvernoratDropDown = value!;
                    annuaire.delegations =
                        annuaire.getDelegation(annuaire.gouvernoratDropDown);
                    annuaire.delegationDropDown = "Delegation*";
                    annuaire.filterSchoolsToDisplay(
                        Globals.gouvNumber[value], annuaire.delegationDropDown);
                  });
                }),
            SizedBox(height: 20),
            DropdownButton<String>(
                value: annuaire.delegationDropDown,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Color.fromARGB(255, 57, 189, 179),
                ),
                isExpanded: true,
                underline: Container(
                  height: 2.0,
                  color: Color.fromARGB(255, 57, 189, 179),
                ),
                items: annuaire.delegations
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: Theme.of(context).textTheme.labelMedium),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    annuaire.delegationDropDown = value!;
                    annuaire.filterSchoolsToDisplay(
                        Globals.gouvNumber[annuaire.gouvernoratDropDown],
                        value);
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: SizedBox(
                height: 350,
                width: 200,
                child: GoogleMap(
                  mapType: MapType.normal,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: false,
                  markers: annuaire.markers.toSet(),
                  initialCameraPosition: CameraPosition(
                      zoom: 11.0,
                      target: LatLng(35.844577307918904, 10.605375333978015)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: annuaire.schoolsToDisplay.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        color: Color.fromRGBO(19, 188, 175, 0.15),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${annuaire.schoolsToDisplay[index].name}",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star),
                                      Text("9",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      TextButton(
                                          onPressed: () {
                                            debugPrint(annuaire
                                                .schoolsToDisplay[index].photos
                                                .toString());
                                          },
                                          child: Text("notez",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline)))
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Utils.navigateTo(
                                            context,
                                            SchoolDetail(
                                                id: annuaire
                                                    .schoolsToDisplay[index]
                                                    .id));
                                      },
                                      icon: Icon(Icons.remove_red_eye_outlined))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset("images/auto.png", scale: 2),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          Text(
                                              Utils.substr(
                                                  annuaire
                                                      .schoolsToDisplay[index]
                                                      .address!
                                                      .toLowerCase(),
                                                  13),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.phone),
                                          Text(
                                              "${annuaire.schoolsToDisplay[index].schoolTel}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1)
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Footer()
          ],
        ));
  }
}
