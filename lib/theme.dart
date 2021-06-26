import 'package:flutter/material.dart';

class TouristTheme {
  static final Color _lightGreen = Color.fromARGB(255, 96, 154, 99);
  static final Color _darkGreen = Color.fromARGB(255, 0, 122, 83);
  static final Color _51grey = Color.fromARGB(255, 51, 51, 51);
  static final Color yellow = Color.fromARGB(255, 241, 180, 52);
  static final Color white = Colors.white;

  static final Color backgroundColor = _51grey;
  static final Color fabBackgroundColor = yellow;
  static final Color fabColor = _darkGreen;
  static final Color navBarBackgroundColor = _darkGreen;
  static final Color navBarItemColor = white;
  static final Color navBarItemColorActive = yellow;
  static final Color sliderActiveDotColor = _lightGreen;
  static final Color activeColor = _lightGreen;
  static final Color splashColor = _lightGreen;

  static final TextStyle titleStyle = TextStyle(
      fontSize: 20,
      color: white,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      letterSpacing: 1.1);

  static final TextStyle titleStyleColored = TextStyle(
      fontSize: 16,
      color: yellow,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      letterSpacing: 1.1);
}
