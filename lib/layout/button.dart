import 'package:flutter/material.dart';

import '../theme.dart';

class Button extends StatelessWidget {
  Button(
      {this.onPressed,
      this.text = '',
      this.color,
      this.splash = true,
      this.background = Colors.transparent});

  final Function onPressed;

  final bool splash;

  final String text;

  final Color color;

  final Color background;

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(
              color: this.color == null ? TouristTheme.white : color)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all<Color>(background),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      // style: TextButton.styleFrom(
      //     backgroundColor: Colors.transparent,
      //     primary: this.splash ? TouristTheme.splashColor : Colors.transparent),
    );
  }
}
