// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lexi_mobile/views/question_view.dart';
import 'package:lexi_mobile/components/custom_appbar_view.dart';
import 'package:lexi_mobile/components/custom_text_button.dart';
import 'package:lexi_mobile/components/drawer_user.dart';
import 'package:lexi_mobile/components/footer.dart';
import 'package:lexi_mobile/utils.dart';

import '../color.dart';
import '../models/serie_model.dart';
import '../vm/serie_view_model.dart';

class SerieView extends StatefulWidget {
  String id;
  SerieView({Key? key, required this.id}) : super(key: key);

  @override
  State<SerieView> createState() => _SerieViewState();
}

class _SerieViewState extends State<SerieView> {
  SerieViewModel serieVM = SerieViewModel();
  @override
  void initState() {
    super.initState();
    serieVM.chronometer.start();
    serieVM.getSolde();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Series>(
        future: serieVM.getSerie(widget.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              appBar: CustomAppBar(
                title: snapshot.data!.name.toString(),
                backgroudColor: Colors.lightBlue,
              ),
              drawer: AppDrawer(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //card and footer
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //serie and questions
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "السؤال : ${Utils.displayQuestionNumber(serieVM.currentQuestion, snapshot.data!.questions!.length)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          "${snapshot.data!.name} : السلسلة",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Question component
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: QuestionView(
                                        id: snapshot
                                            .data!
                                            .questions![
                                                serieVM.currentQuestion - 1]
                                            .id),
                                  ),
                                  //next and correct
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomTextButton(
                                            text: "إصلاح",
                                            onPressed: () {
                                              serieVM
                                                  .correctionHandler(context);
                                            },
                                            color: primary),
                                        CustomTextButton(
                                            text: ">",
                                            onPressed: () {
                                              setState(() {
                                                serieVM.nextQuestionHandler(
                                                    snapshot.data!.questions!
                                                        .length,
                                                    context);
                                              });
                                            },
                                            color: primary)
                                      ],
                                    ),
                                  ),
                                  //return
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: CustomTextButton(
                                        text: "< Retour",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SocialLinks(),
                      ),
                      Text(
                        "© 2022-2019 TOUS DROITS RESERVES LEXI",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: labelColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
