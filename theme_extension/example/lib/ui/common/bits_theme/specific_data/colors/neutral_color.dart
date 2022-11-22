import 'package:flutter/material.dart';

class NeutralColor extends ColorSwatch<int> {
  const NeutralColor(int primary, Map<int, Color> swatch) : super(primary, swatch);

  Color get shade100 => this[100]!;
  Color get shade80 => this[80]!;
  Color get shade60 => this[60]!;
  Color get shade40 => this[40]!;
  Color get shade30 => this[30]!;
  Color get shade20 => this[20]!;
  Color get shade10 => this[10]!;
  Color get white => this[0]!;
}
