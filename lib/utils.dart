// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'globals.dart';
import 'package:intl/intl.dart';

import 'views/home_page_view.dart';
import 'views/login_view.dart';

class Utils {
  static String substr(String chaine, int longueur) {
    return chaine.length > longueur
        ? "${chaine.substring(0, longueur)}..."
        : chaine;
  }

  static openLink(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  static void navigateTo(BuildContext context, Widget path) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => path,
        ));
  }

  static void displaySnackBar(
      BuildContext context, String state, String content) {
    Color? snackColor;
    switch (state) {
      case "valid":
        snackColor = Colors.green;
        break;
      case "error":
        snackColor = Colors.red;
        break;
      default:
        Color.fromARGB(255, 57, 189, 179);
    }
    SnackBar snackbar = SnackBar(
      content: Text(content,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.white)),
      backgroundColor: snackColor,
      duration: Duration(seconds: 3),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static List<String> getGouvernorat() {
    List<String> response = ["Gouvernorat*"];
    Globals.gouvernorat.map((e) => response.add(e.name)).toList();
    response.sort(((a, b) =>
        Globals.gouvNumber[a]!.compareTo(Globals.gouvNumber[b].toString())));
    return response;
  }

  static void isAuth(BuildContext context) async {
    if (await SessionManager().get("user") != null) {
      navigateTo(context, HomePage());
    } else {
      navigateTo(context, LoginView());
    }
  }

  static String toDateTime(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);
    return '$date $time';
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    return date;
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);
    return time;
  }

  static DateTime removeTime(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  static String displayQuestionNumber(
      int questionNumber, int numberOfQuestion) {
    return "$questionNumber/$numberOfQuestion";
  }
}
