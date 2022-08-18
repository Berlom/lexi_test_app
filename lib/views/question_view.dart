// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../vm/question_view_model.dart';

class QuestionView extends StatefulWidget {
  String? id;
  QuestionView({Key? key, this.id}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  QuestionViewModel questionVM = QuestionViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Question>(
      future: questionVM.getQuestion(widget.id.toString()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          QuestionViewModel.currentQuestionAnswer = questionVM.getResponseBody(
              snapshot.data!.responsesBody, snapshot.data!.response.toString());
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:
                      Image.network(snapshot.data!.questionPicture.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    snapshot.data!.value.toString(),
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          RadioButton(
                              body:
                                  "أ : ${questionVM.getResponseBody(snapshot.data!.responsesBody, "A")}",
                              value: "A",
                              onChange: (String? value) {
                                setState(() {
                                  QuestionViewModel.chosenOption = value;
                                });
                              }),
                          RadioButton(
                              body:
                                  "ب : ${questionVM.getResponseBody(snapshot.data!.responsesBody, "B")}",
                              value: "B",
                              onChange: (String? value) {
                                setState(() {
                                  QuestionViewModel.chosenOption = value;
                                });
                              }),
                          RadioButton(
                              body:
                                  "ج : ${questionVM.getResponseBody(snapshot.data!.responsesBody, "C")}",
                              value: "C",
                              onChange: (String? value) {
                                setState(() {
                                  QuestionViewModel.chosenOption = value;
                                });
                              }),
                        ],
                      ),
                    ))
              ],
            ),
          );
        }
      },
    );
  }
}

class RadioButton extends StatelessWidget {
  String body;
  String value;
  void Function(String?) onChange;
  RadioButton(
      {Key? key,
      required this.body,
      required this.value,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        body,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Radio<String>(
          value: value,
          groupValue: QuestionViewModel.chosenOption,
          onChanged: onChange),
    );
  }
}
