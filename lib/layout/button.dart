import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.onPressed, this.text = ''});

  final Function onPressed;

  final String text;

  Widget build(BuildContext context) {
    print(text);
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
      style: TextButton.styleFrom(
          backgroundColor: Colors.amber, primary: Colors.black),
    );
  }
}
