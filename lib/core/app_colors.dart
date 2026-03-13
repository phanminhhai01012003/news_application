import 'package:flutter/material.dart';

class AppColors {
  static Color green = Colors.green.shade500;
  static Color red = Color.fromARGB(255, 222, 7, 7);
  static Color blue = Color(0xFF150EE2);
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color grey = Colors.grey.shade700;
  static Color yellow = Color.fromARGB(255, 244, 222, 23);
  static Gradient backgroundGradients = LinearGradient(
    colors: [
      Color(0xFF150EE2),
      Color.fromARGB(255, 222, 7, 7),
      Color.fromARGB(255, 4, 152, 9),
    ],
    stops: [0.1, 0.25, 0.5, 0.75]
  );
}