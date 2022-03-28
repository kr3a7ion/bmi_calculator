// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constans/constants.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({required this.myImage, required this.lebel});

  final String myImage;
  final String lebel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          myImage,
          fit: BoxFit.contain,
          height: 100,
          width: 100,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          lebel,
          style: kLebelTextStyle,
        )
      ],
    );
  }
}
