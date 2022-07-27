// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../components/annuaire_drawer.dart';
import '../components/footer.dart';
import '../components/icon_text_description.dart';
import '../config/parametre.config.dart';
import '../models/school_model.dart';
import '../social_ icons.dart';
import '../utils.dart';
import '../vm/school_detail_view_model.dart';

class SchoolDetail extends StatelessWidget {
  String? id;
  SchoolDetail({Key? key, required this.id}) : super(key: key);

  SchoolDetailViewModel schoolDetail = SchoolDetailViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 57, 189, 179)),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Image.asset(ParameterConfig["logo"])),
        resizeToAvoidBottomInset: true,
        drawer: AnnuaireDrawer(),
        body: ListView(
          children: [
            FutureBuilder<SchoolModel>(
                future: schoolDetail.getSchool(id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      children: [
                        Text("${snapshot.data!.name}",
                            style: Theme.of(context).textTheme.headline3),
                        SizedBox(
                          height: 50.0,
                        ),
                        IconTextDescription(
                            icon: Icons.location_on,
                            description: Utils.substr(
                                snapshot.data!.address ?? "non indiqué", 30)),
                        IconTextDescription(
                            icon: Icons.phone,
                            description: Utils.substr(
                                snapshot.data!.schoolTel ?? "non indiqué", 30)),
                        IconTextDescription(
                            icon: Icons.facebook,
                            description: Utils.substr(
                                snapshot.data!.facebookLink ?? "non indiqué",
                                30)),
                        IconTextDescription(
                            icon: SocialIcons.instagram,
                            description: Utils.substr(
                                snapshot.data!.instaLink ?? "non indiqué", 30)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: CarouselSlider(
                              items: schoolDetail
                                  .getCarouselItems(snapshot.data!.photos!),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 2000))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: SizedBox(
                            height: 350,
                            width: 200,
                            child: schoolDetail.getMap(snapshot.data!),
                          ),
                        ),
                      ],
                    );
                  }
                }),
            Footer()
          ],
        ));
  }
}
