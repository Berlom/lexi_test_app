// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../ImageSlider.dart';
import '../utils.dart';
import '../views/lexi_view.dart';

class LandingPageViewModel {
  static final List<ImageSlider> imgList = [
    ImageSlider(
        imagePath: 'images/bg1.png',
        description: "هذا تعليق من أجل التجربة",
        youtubeURL: "https://www.youtube.com/watch?v=vZsMSvhiPzM"),
    ImageSlider(
        imagePath: 'images/bg2.jpg',
        description: "this is a description",
        youtubeURL: "youtubeURL"),
    ImageSlider(
        imagePath: 'images/bg3.jpg',
        description: "this is a description",
        youtubeURL: "youtubeURL"),
    ImageSlider(
        imagePath: 'images/bg4.jpg',
        description: "this is a description",
        youtubeURL: "youtubeURL"),
  ];

  int currentSliderIndex = 0;
  final CarouselController carouselController = CarouselController();
  static double? height;
  static double? width;

  List<Widget> getImageSliders(BuildContext context) {
    return imgList
        .map((item) => Center(
              child: Stack(
                children: [
                  Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              // ignore: prefer_const_literals_to_create_immutables
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 5.0)
                              ]),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black.withOpacity(0.5)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ))),
                            onPressed: () => Utils.openLink(item.youtubeURL),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 13.0,
                                  left: 50.0,
                                  right: 50.0),
                              child: Text(
                                "إكتشاف",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  void skipTutorial(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LexiView()));
  }
}
