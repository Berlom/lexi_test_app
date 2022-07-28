// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  CustomTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
