// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:bmi_calculator/component/reuseable_card.dart';
import 'package:bmi_calculator/constans/constants.dart';
import 'package:flutter/material.dart';
import '../component/bottom_button_icon.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmiresult;
  final String resultImterpretation;
  final String bmiRangeIndicator;
  final String bmiRange;

  const ResultPage(
      {required this.resultText,
      required this.bmiresult,
      required this.resultImterpretation,
      required this.bmiRange,
      required this.bmiRangeIndicator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: const Text(
              'Your Result',
              style: kYourResultTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: ReuseableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kWeightIndicatorTextstyle,
                    ),
                    Text(
                      bmiresult,
                      style: kWeightNumberTextStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          bmiRangeIndicator,
                          style: kRangeTextStyle,
                        ),
                        Text(
                      bmiRange,
                      style: kDescriptionTextStyle,
                    ),
                      ],
                    ),
                    
                    Text(
                      resultImterpretation,
                      textAlign: TextAlign.center,
                      style: kDescriptionTextStyle,
                    )
                  ],
                ),
              )),
          BottomButtonIcon(
            buttonText: 'RE-CALCULATE',
            ontapped: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
