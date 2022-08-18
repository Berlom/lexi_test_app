// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_const, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'custom_images.dart';

class CodeEnLigneUserTiles extends StatelessWidget {
  CodeEnLigneUserTiles({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.grey),
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
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(data["name"],
                    style: const TextStyle(
                        color: const Color.fromARGB(255, 19, 188, 175),
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
