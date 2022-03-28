import 'package:bmi_calculator/bmi_logic.dart';
import 'package:bmi_calculator/component/card_icon.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import '../component/bottom_button_icon.dart';
import 'package:bmi_calculator/component/reuseable_card.dart';
import 'package:bmi_calculator/component/round_icon_button.dart';
import 'package:flutter/material.dart';
import '../constans/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 43;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                      ontapped: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: const CardIcon(
                        myImage: 'assets/images/male.png',
                        lebel: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      ontapped: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: const CardIcon(
                        myImage: 'assets/images/female.png',
                        lebel: 'Female',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLebelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'Cm',
                          style: kLebelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                        colour: kactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kLebelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RoundIconButton(
                                    icons: FontAwesomeIcons.minus,
                                    ontapped: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  RoundIconButton(
                                      icons: FontAwesomeIcons.plus,
                                      ontapped: () {
                                        setState(() {
                                          weight++;
                                        });
                                      })
                                ])
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLebelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  icons: FontAwesomeIcons.minus,
                                  ontapped: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                    icons: FontAwesomeIcons.plus,
                                    ontapped: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ])
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButtonIcon(
              buttonText: 'CALCULATE',
              ontapped: () {
                setState(() {
                  BmiCalculatorLogic calculate =
                      BmiCalculatorLogic(height: height, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiresult: calculate.bmiCalculate(),
                                resultText: calculate.bmiGetResult(),
                                bmiRangeIndicator:
                                    calculate.bmiRangeIndicator(),
                                bmiRange: calculate.bmiGetRange(),
                                resultImterpretation:
                                    calculate.bmiGetInterpretation(),
                                
                                
                              )));
                });
              },
            ),
          ],
        ));
  }
}
