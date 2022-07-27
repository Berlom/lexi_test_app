// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

import 'gouvernorat.dart';

class Globals {
  static List courses = [
    {
      "id": 100,
      "name": "Cours",
      "image": "images/cour.jpg",
      "price": "CourView()",
      "duration": {"tile1", "tile2", "tile3", "tile4"},
    },
    {
      "id": 101,
      "name": "Test",
      "image": "images/test.jpg",
      "price": "TestView()",
      "duration": {"tile5", "tile6", "tile7", "tile8"},
      "session": "12 lessons",
      "review": "5",
      "is_favorited": true,
      "description":
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    },
    {
      "id": 102,
      "name": "Examens Blancs",
      "image": "images/examin_blanc.jpg",
      "price": "ExamensBlancsView()",
      "duration": "12 hours",
      "session": "4 lessons",
      "review": "4.5",
      "is_favorited": false,
      "description":
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    },
    {
      "id": 103,
      "name": "Mon Historique",
      "image": "images/historique.jpg",
      "price": "HistoriqueView()",
      "duration": "4 hours",
      "session": "3 lessons",
      "review": "4.5",
      "is_favorited": false,
      "description":
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    }
  ];
  static Map<String, String> gouvNumber = {
    "Gouvernorat*": "0",
    "Tunis": "01",
    "Sfax": "02",
    "Nabeul": "03",
    "Bizerte": "04",
    "Kairouan": "05",
    "Jendouba": "06",
    "Medenine": "07",
    "Gabes": "08",
    "Sousse": "09",
    "Beja": "10",
    "Kasserine": "11",
    "Gafsa": "12",
    "Kef": "13",
    "Monastir": "14",
    "Sidi Bouzid": "15",
    "Mahdia": "16",
    "Zaghouan": "17",
    "Siliana": "18",
    "Tozeur": "19",
    "Kebili": "20",
    "Tataouine": "21",
    "Ben Arous": "22",
    "Ariana": "23",
    "Manouba": "24",
  };

  static List<Gouvernorat> gouvernorat = [
    Gouvernorat(name: "Ariana", delegation: [
      "Ariana Ville",
      "La Soukra",
      "Ettadhamen",
      "Raoued",
      "Mnihla",
      "Kalaat el Andalous",
      "Sidi Thabet"
    ]),
    Gouvernorat(name: "Beja", delegation: [
      "Beja Nord",
      "Nefza",
      "Beja Sud",
      "Medjez el Bab",
      "Testour",
      "Teboursouk",
      "Amdoun",
      "Goubellat",
      "Thibar"
    ]),
    Gouvernorat(name: "Ben Arous", delegation: [
      "El Mourouj",
      "Fouchana",
      "Mornag",
      "Mohamedia",
      "Rades",
      "Medina Jedida",
      "Hammam Lif",
      "Ben Arous",
      "Ezzahra",
      "Bou Mhel el Bassatine",
      "Hammam Chott",
      "Megrine",
    ]),
    Gouvernorat(name: "Bizerte", delegation: [
      "Bizerte Nord",
      "Menzel Bourguiba",
      "Ras Jebel",
      "Mateur",
      "Bizerte Sud",
      "Sejnane",
      "Menzel Jemil",
      "Joumine",
      "Ghezala",
      "El Alia",
      "Zarzouna",
      "Tinja",
      "Ghar El Melh",
      "Utique"
    ]),
    Gouvernorat(name: "Gabes", delegation: [
      "El Hamma",
      "Gabes Sud",
      "Mareth",
      "Gabes Medina",
      "Gabes Ouest",
      "Metouia",
      "Ghannouch",
      "Nouvelle Matmata",
      "Menzel El Habib",
      "Matmata"
    ]),
    Gouvernorat(name: "Gafsa", delegation: [
      "Gafsa Sud",
      "Metlaoui",
      "Sened",
      "El Ksar",
      "Moulares",
      "Redeyef",
      "El Guettar",
      "Belkhir",
      "Mdhilla",
      "Gafsa Nord",
      "Sidi Aïch"
    ]),
    Gouvernorat(name: "Jendouba", delegation: [
      "Jendouba Sud",
      "Ghardimaou",
      "Fernana",
      "Tabarka",
      "Jendouba Nord",
      "Balta Bou Aouane",
      "Aïn Draham",
      "Bou Salem",
      "Oued Meliz"
    ]),
    Gouvernorat(name: "Kairouan", delegation: [
      "Kairouan Nord",
      "Kairouan Sud",
      "Bou Hajla",
      "Sbikha",
      "Haffouz",
      "Nasrallah",
      "Oueslatia",
      "Hajeb El Ayoun",
      "Chebika",
      "El Alaa",
      "Echrarda"
    ]),
    Gouvernorat(name: "Kasserine", delegation: [
      "Kasserine Nord",
      "Feriana",
      "Sbiba",
      "Foussana",
      "Thala",
      "Majel Bel Abbes",
      "Kasserine Sud",
      "Ezzouhour",
      "El Ayoun",
      "Hassi El Ferid",
      "Jedelienne",
      "Haïdra"
    ]),
    Gouvernorat(name: "Kebili", delegation: [
      "Kebili Sud",
      "Kebili Nord",
      "Souk Lahad",
      "Douz Nord",
      "Douz Sud",
      "Faouar"
    ]),
    Gouvernorat(name: "Kef", delegation: [
      "Kef Est",
      "Dahmani",
      "Tajerouine",
      "Kef Ouest",
      "Nebeur",
      "Sers",
      "Sakiet Sidi Youssef",
      "El Ksour",
      "Kalaat Senan",
      "Jerissa",
      "Kalaat Khasba",
    ]),
    Gouvernorat(name: "Manouba", delegation: [
      "Douar Hicher",
      "Oued Ellil",
      "La Manouba",
      "Tebourba",
      "Djedeida",
      "Mornaguia",
      "El Batan",
      "Borj El Amri"
    ]),
    Gouvernorat(name: "Mahdia", delegation: [
      "Mahdia",
      "Ksour Essef",
      "Essouassi",
      "El Jem",
      "Sidi Alouane",
      "Bou Merdes",
      "Chorbane",
      "Chebba",
      "Ouled Chamekh",
      "Mellouleche",
      "Hebira"
    ]),
    Gouvernorat(name: "Medenine", delegation: [
      "Zarzis",
      "Ben Gardane",
      "Houmt Souk",
      "Midoun",
      "Medenine Nord",
      "Medenine Sud",
      "Beni Khedache",
      "Ajim",
      "Sidi Makhlouf"
    ]),
    Gouvernorat(name: "Monastir", delegation: [
      "Monastir",
      "Moknine",
      "Jemmal",
      "Ksar Hellal",
      "Teboulba",
      "Ksibet el Mediouni",
      "Bembla",
      "Zeramdine",
      "Sayada Lamta Bou Hajar",
      "Sahline",
      "Ouerdanine",
      "Bekalta",
      "Beni Hassen",
    ]),
    Gouvernorat(name: "Nabeul", delegation: [
      "Hammamet",
      "Korba",
      "Nabeul",
      "Menzel Temime",
      "Grombalia",
      "Kelibia",
      "Soliman",
      "Dar Chaabane El Fehri",
      "El Haouaria",
      "Beni Khiar",
      "Beni Khalled",
      "Menzel Bouzelfa",
      "Bou Argoub",
      "El Mida",
      "Takelsa",
      "Hammam Ghezeze",
    ]),
    Gouvernorat(name: "Sfax", delegation: [
      "Sfax Ville",
      "Sfax Ouest",
      "Sfax Sud",
      "Sakiet Eddaïer",
      "Sakiet Ezzit",
      "Bir Ali Ben Khalifa",
      "Thyna",
      "Jebiniana",
      "El Hencha",
      "Agareb",
      "Menzel Chaker",
      "Mahres",
      "Skhira",
      "El Amra",
      "Graïba",
      "Kerkennah",
    ]),
    Gouvernorat(name: "Sidi Bouzid", delegation: [
      "Sidi Bouzid Ouest",
      "Regueb",
      "Sidi Bouzid Est",
      "Jilma",
      "Bir El Hafey",
      "Sidi Ali Ben Aoun",
      "Menzel Bouzaiane",
      "Mezzouna",
      "Meknassy",
      "Ouled Haffouz",
      "Souk Jedid",
      "Cebbala Ouled Asker"
    ]),
    Gouvernorat(name: "Siliana", delegation: [
      "Makthar",
      "Rouhia",
      "Siliana Sud",
      "Siliana Nord",
      "El Krib",
      "Bou Arada",
      "Gaafour",
      "Kesra",
      "Sidi Bou Rouis",
      "Bargou",
      "El Aroussa"
    ]),
    Gouvernorat(name: "Sousse", delegation: [
      "Msaken",
      "Sousse Riadh",
      "Sousse Jawhara",
      "Kalaa Kebira",
      "Sousse Sidi Abdelhamid",
      "Enfida",
      "Hammam Sousse",
      "Sousse Medina",
      "Kalaa Seghira",
      "Akouda",
      "Bouficha",
      "Sidi Bou Ali",
      "Kondar",
      "Sidi El Hani",
      "Hergla"
    ]),
    Gouvernorat(name: "Tataouine", delegation: [
      "Tataouine Nord",
      "Tataouine Sud",
      "Ghomrassen",
      "Smar",
      "Remada",
      "Bir Lahmar",
      "Dehiba"
    ]),
    Gouvernorat(name: "Tozeur", delegation: [
      "Tozeur",
      "Degache",
      "Nefta",
      "Tameghza",
      "Hazoua",
    ]),
    Gouvernorat(name: "Tunis", delegation: [
      "Hraïria",
      "El Kabaria",
      "Sidi Hassine",
      "La Marsa",
      "Le Bardo",
      "El Omrane superieur",
      "Le Kram",
      "El Menzah",
      "El Omrane",
      "Ezzouhour",
      "Bab El Bhar",
      "Cite El Khadra",
      "Sejoumi",
      "El Ouardia",
      "Bab Souika",
      "Sidi El Bechir",
      "La Goulette",
      "Medina",
      "Djebel Jelloud",
      "Ettahrir",
      "Carthage"
    ]),
    Gouvernorat(name: "Zaghouan", delegation: [
      "El Fahs",
      "Zaghouan",
      "Nadhour",
      "Bir Mcherga",
      "Zriba",
      "Saouaf"
    ]),
  ];

  static TextTheme textTheme = TextTheme(
    //le grand titre de page
    headline1:
        TextStyle(fontSize: 30, letterSpacing: 4.0, fontWeight: FontWeight.bold,
            // ignore: prefer_const_literals_to_create_immutables
            shadows: [
          Shadow(color: Colors.black, blurRadius: 10.0),
        ]),
    headline2:
        TextStyle(fontSize: 28, letterSpacing: 3.0, fontWeight: FontWeight.w600,
            // ignore: prefer_const_literals_to_create_immutables
            shadows: [
          Shadow(color: Colors.black, blurRadius: 10.0),
        ]),
    //les titres
    headline3: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    //dropdown
    labelMedium: TextStyle(fontSize: 16, letterSpacing: 2.0),
    button: TextStyle(fontSize: 20, letterSpacing: 2.0),
    //body
    bodyText1: TextStyle(fontSize: 16),
    bodyText2: TextStyle(fontSize: 18),
  );

  static ThemeData darkMode = ThemeData.dark().copyWith(
      textTheme: textTheme.apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
          decorationColor: Colors.white));

  static ThemeData lightMode = ThemeData.light().copyWith(
    textTheme: textTheme.apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
        decorationColor: Colors.black),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );
}
