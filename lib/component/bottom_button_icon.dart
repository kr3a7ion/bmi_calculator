// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../constans/constants.dart';

class BottomButtonIcon extends StatelessWidget {
  const BottomButtonIcon({required this.buttonText, required this.ontapped});
  final String buttonText;
  final void Function() ontapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontapped,
        child: Container(
          child: Center(
            child: Text(buttonText, style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'assets/fonts/Pacifico',
            ),),
          ),
          decoration: BoxDecoration(
            color: kbuttomContainerColor,
            borderRadius: BorderRadius.circular(20)
          ),
          margin: kbuttomContainerMargin,
          
          height: kbuttomContainerHeight,
          width: double.infinity,
        ));
  }
}
