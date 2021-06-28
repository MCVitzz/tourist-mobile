import 'package:flutter/material.dart';

import '../theme.dart';

class Button extends StatelessWidget {
  Button(
      {this.onPressed,
      this.text = '',
      this.color,
      this.icon,
      this.size,
      this.splash = true,
      this.background = Colors.transparent});

  final Function onPressed;

  final bool splash;

  final double size;

  final String text;

  final Color color;

  final Color background;

  final IconData icon;

  Widget build(BuildContext context) {
    Widget child = Text(text,
        style: TextStyle(
            color: this.color == null ? TouristTheme.white : color,
            fontSize: size));

    if (text == '') {
      child = Icon(icon, color: color, size: size);
    }

    return TextButton(
      onPressed: onPressed,
      child: child,
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
