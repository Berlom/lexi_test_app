// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../vm/landing_page_view_model.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyCarousel();
  }
}

class MyCarousel extends State<LandingPageView> {
  LandingPageViewModel landingPage = LandingPageViewModel();

  @override
  Widget build(BuildContext context) {
    LandingPageViewModel.height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              CarouselSlider(
                carouselController: landingPage.carouselController,
                items: landingPage.getImageSliders(context),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: LandingPageViewModel.height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      landingPage.currentSliderIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                  right: 10.0,
                  top: 30.0,
                  child: TextButton(
                    onPressed: (() {
                      landingPage.skipTutorial(context);
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Skip",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  color: Colors.white),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.skip_next,
                          size: 25.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 10.0,
                child: Container(
                  height: 50.0,
                  width: 150.0,
                  margin: EdgeInsets.symmetric(horizontal: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: LandingPageViewModel.imgList
                        .asMap()
                        .entries
                        .map((entry) {
                      return GestureDetector(
                        onTap: () => landingPage.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(
                                  landingPage.currentSliderIndex == entry.key
                                      ? 0.9
                                      : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
