// ignore_for_file: prefer_const_constructors

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../drawer_item.dart';
import '../globals.dart';
import '../gouvernorat.dart';
import '../models/school_model.dart';
import '../repository/school_repository.dart';
import '../views/annuaire_view.dart';
import '../views/landing_page_view.dart';
import '../views/login_view.dart';
import '../views/register_view.dart';

class AnnuaireViewModel {
  String gouvernoratDropDown = "Gouvernorat*";
  String delegationDropDown = "Delegation*";
  List<String> delegations = ["Delegation*"];
  List<SchoolModel> schools = [];
  List<Marker> markers = [
    Marker(
        markerId: MarkerId("test"),
        position: LatLng(35.70982213571465, 10.674041510133074))
  ];
  List<SchoolModel> schoolsToDisplay = [];
  List<DrawerItem> drawerItems = [
    DrawerItem(name: "Accueil", path: LandingPageView()),
    DrawerItem(name: "Services", path: LandingPageView()),
    DrawerItem(name: "Tarification", path: LandingPageView()),
    DrawerItem(name: "Contact", path: LandingPageView()),
    DrawerItem(name: "Connexion", path: LoginView()),
    DrawerItem(name: "Inscription", path: RegisterView()),
    DrawerItem(name: "Annuaire", path: Annuaire()),
  ];

  List<String> getDelegation(String gouv) {
    List<String> response = ["Delegation*"];
    List<Gouvernorat> gouvRef = [];
    gouvRef.addAll(Globals.gouvernorat);
    gouvRef.retainWhere((element) => element.name == gouv);
    gouvRef.map((e) => response.addAll(e.delegation)).toList();
    return response;
  }

  void filterSchoolsToDisplay(String? gouv, String deleg) {
    schoolsToDisplay.clear();
    schoolsToDisplay.addAll(schools);
    schoolsToDisplay.retainWhere((element) => element.gouvornorate == gouv);
    deleg != "Delegation*"
        ? schoolsToDisplay
            .retainWhere((element) => element.delegation == deleg.toUpperCase())
        : "";
  }

  List<Marker> setMarkers() {
    List<Marker> markersVar = [];
    schools
        .map((e) => (e.latitude != null && e.longitude != null)
            ? markersVar.add(Marker(
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                    title: e.name, snippet: e.address ?? "non indiqué"),
                markerId: MarkerId("${e.id}"),
                position: LatLng(double.parse(e.latitude.toString()),
                    double.parse(e.longitude.toString()))))
            : "")
        .toList();
    return markersVar;
  }

  Future<void> getSchools() async {
    schools = await SchoolRepository().findAll();
  }
}
