// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final void Function()? ontapped;

  const ReuseableCard({this.colour, this.cardChild, this.ontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontapped!();
      },
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
