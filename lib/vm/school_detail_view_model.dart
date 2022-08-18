// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/school_model.dart';
import '../repository/school_repository.dart';

class SchoolDetailViewModel {
  List<String> carouselList = [
    "images/auto1.jfif",
    "images/auto2.jpg",
    "images/auto3.jfif"
  ];
  SchoolModel? school;
  Future<SchoolModel> getSchool(String? id) async {
    return await SchoolRepository().findOneById(id);
  }

  GoogleMap getMap(SchoolModel school) {
    if (school.latitude == null && school.longitude == null) {
      return GoogleMap(
          mapType: MapType.normal,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: false,
          initialCameraPosition: CameraPosition(
              zoom: 5.0,
              target: LatLng(35.844577307918904, 10.605375333978015)));
    } else {
      return GoogleMap(
        mapType: MapType.normal,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: false,
        markers: {
          Marker(
              markerId: MarkerId(school.id.toString()),
              infoWindow: InfoWindow(
                  title: school.name, snippet: school.address ?? "non indiqué"),
              position: LatLng(double.parse(school.latitude.toString()),
                  double.parse(school.longitude.toString())))
        },
        initialCameraPosition: CameraPosition(
            zoom: 11.0,
            target: LatLng(double.parse(school.latitude.toString()),
                double.parse(school.longitude.toString()))),
      );
    }
  }

  List<Widget> getCarouselItems(List<Photos> photos) {
    if (photos.isNotEmpty) {
      return photos
          .map((e) => SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                    "https://www.lexi.tn/ds_backend/public${e.path.toString()}"),
              ))
          .toList();
    }
    return carouselList
        .map((e) => SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(e),
            ) )
        .toList();
  }
}
