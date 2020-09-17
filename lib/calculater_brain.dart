import 'dart:math';

class Calculaterbrain {
  final int height;
  final int weight;
  double bmi;
  Calculaterbrain({this.height, this.weight});

  String calculatebmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (bmi > 25)
      return 'Overweight';
    else if (bmi > 18)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getinterpretation() {
    if (bmi > 25)
      return 'You have higher than the normal body weight';
    else if (bmi > 18)
      return 'YOu have a Normal body weight';
    else
      return 'you have a lower than the normal body weight, Eat more';
  }
}
