import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilInfoWidget extends StatelessWidget {
  final String title;
  final String info1;
  final String info2;
  final String info3;
  final String info4;
  final String info5;
  final double width;
  final Color info5Color;
  final Color info3Color;
  final FontWeight fontWeight;
  const ProfilInfoWidget(
      {Key? key,
      required this.fontWeight,
      required this.info5Color,
      required this.info3Color,
      required this.title,
      required this.info1,
      required this.info2,
      required this.info3,
      required this.info4,
      required this.info5,
      required this.width})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: ScreenUtilInit(
          // designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.93,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.grey),
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),

                        Text(
                          title,
                          style: const TextStyle(fontSize: 21),
                        ),
                        const SizedBox(height: 15),

                        Row(children: [
                          Container(
                            width: 55,
                            height: 55,
                            // margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 188, 175),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                style: TextStyle(
                                    fontWeight: fontWeight,
                                    color: Colors.white,
                                    fontSize: 15),
                                info1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            info2,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ]),
                        const SizedBox(height: 10),

                        // Container(
                        //     child: Image.asset("assets/images/greenBar.png")),
                        Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: info3Color,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  info3,
                                  style: TextStyle(
                                      fontWeight: fontWeight,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              info4,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(width: 7),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: width),
                    Container(
                      width: 70,
                      height: 70,
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 5,
                            style: BorderStyle.solid,
                            color: info5Color,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          info5,
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }
}
