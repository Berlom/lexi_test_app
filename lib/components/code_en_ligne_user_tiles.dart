import 'package:flutter/material.dart';

import 'custom_images.dart';

class CodeEnLigneUserTiles extends StatelessWidget {
  CodeEnLigneUserTiles({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImages(
            data["image"],
            radius: 3,
            width: 100,
            height: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(data["name"],
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 188, 175),
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          // Icon(
          //   Icons.arrow_forward_ios_rounded,
          //   color: labelColor,
          //   size: 15,
          // )
        ],
      ),
    );
  }
}
