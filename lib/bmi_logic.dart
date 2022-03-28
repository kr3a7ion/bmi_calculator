import 'dart:math';

double _bmiResult = 0;

class BmiCalculatorLogic {
  const BmiCalculatorLogic({required this.height, required this.weight});

  final int height;
  final int weight;

  

  String bmiCalculate() {
    _bmiResult = weight / pow(height / 100, 2);
    return _bmiResult.toStringAsFixed(1);
  }

  String bmiGetRange () {
    if (_bmiResult >= 25) {
      return '25 & Above kg/m2';
    } else if (_bmiResult >= 18.5) {
      return '18.5 - 25 kg/m2';
    } else {
      return 'Below 18.5 kg/m2';
    }
  }

  String bmiRangeIndicator () {
    if (_bmiResult >= 25) {
      return 'Overweight BMI range:';
    } else if (_bmiResult >= 18.5) {
      return 'Normal BMI range:';
    } else {
      return 'Underweight Bmi range:';
    }
  }
  String bmiGetResult() {
    if (_bmiResult >= 25) {
      return 'Overweight';
    } else if (_bmiResult >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiGetInterpretation () {
    if (_bmiResult >= 25) {
      return 'You have a higer than NORMAL body weight. Please try to exercise more';
    } else if (_bmiResult >= 18.5) {
      return 'You have a NORMAL body weight. Good Job!';
    } else {
      return 'You have a lower than NORMAL body weight. You should eat a bit more';
    }
  }
}
