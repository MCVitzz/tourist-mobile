import 'package:flutter/material.dart';

class TouristTheme {
  static Color _lightGreen = Color.fromARGB(255, 96, 154, 99);
  static Color _darkGreen = Color.fromARGB(255, 0, 122, 83);
  static Color _51grey = Color.fromARGB(255, 51, 51, 51);
  static Color yellow = Color.fromARGB(255, 241, 180, 52);
  static Color white = Colors.white;

  static Color backgroundColor = _51grey;
  static Color fabBackgroundColor = yellow;
  static Color fabColor = _darkGreen;
  static Color navBarBackgroundColor = _darkGreen;
  static Color navBarItemColor = white;
  static Color navBarItemColorActive = yellow;
  static Color sliderActiveDotColor = _lightGreen;
  static Color activeColor = _lightGreen;
  static Color splashColor = _lightGreen;

  static TextStyle titleStyle = TextStyle(
      fontSize: 20,
      color: white,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      letterSpacing: 1.1);

  static TextStyle titleStyleColored = TextStyle(
      fontSize: 16,
      color: yellow,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      letterSpacing: 1.1);
}
