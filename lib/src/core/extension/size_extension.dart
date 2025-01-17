import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

extension SizeExtension  on int {
  SizedBox getH() => SizedBox(height: (this / 812) * height);

  SizedBox getW() => SizedBox(width: (this / 375) * width);

  double get h => (this / 812) * height;

  double get w => (this / 375) * width;
}
