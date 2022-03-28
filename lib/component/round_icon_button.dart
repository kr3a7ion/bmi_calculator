// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../constans/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  final void Function() ontapped;
  final IconData icons;

  const RoundIconButton({required this.ontapped, required this.icons});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => ontapped(),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      elevation: 2.0,
      splashColor: kbuttomContainerColor,
      constraints: const BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      child: FaIcon(icons),
    );
  }
}
