// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../social_ icons.dart';
import '../utils.dart';
import '../views/terms_of_use_view.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ListView(
          primary: false,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "إتصل بنا",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            GestureDetector(
              onTap: () {
                Utils.displaySnackBar(context, "",
                    "double-clic pour passer un appel téléphonique");
              },
              onDoubleTap: () {
                Utils.openLink("tel://29 716 345");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("29 716 345",
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Icon(Icons.phone, color: Color.fromARGB(255, 57, 189, 179)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Utils.displaySnackBar(
                    context, "", "double-clic pour envoyer un E-mail");
              },
              onDoubleTap: () {
                Utils.openLink("mailto:contact@lexi.tn");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("contact@lexi.tn",
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Icon(Icons.mail, color: Color.fromARGB(255, 57, 189, 179)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "روابط مهمة",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Utils.navigateTo(context, TermOfUseView());
                    },
                    child: Text("شروط الإستعمال",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(decoration: TextDecoration.underline))),
                Text("أعمل طلا على",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "تواصل إجتماعي",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SocialLinks()
          ],
        ));
  }
}

class CircularIcon extends StatelessWidget {
  IconData icon;
  CircularIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 57, 189, 179),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        child: CircularIcon(icon: Icons.facebook),
        onTap: () {
          Utils.openLink("https://www.facebook.com/lexi.tn/");
        },
      ),
      GestureDetector(
        child: CircularIcon(icon: SocialIcons.instagram),
        onTap: () {
          Utils.openLink("https://www.instagram.com/lexitn/");
        },
      ),
      GestureDetector(
        child: CircularIcon(icon: SocialIcons.youtube_play),
        onTap: () {
          Utils.openLink(
              "https://www.youtube.com/channel/UCohuXgeqgJHmmGVcxhM0ORw");
        },
      ),
    ]);
  }
}
