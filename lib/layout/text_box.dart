import 'package:flutter/material.dart';

import '../theme.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final FocusNode focusNode;
  final Function onTap;

  TextBox({this.controller, this.placeholder, this.focusNode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      focusNode: focusNode,
      decoration: new InputDecoration(
          hintText: placeholder,
          focusColor: TouristTheme.yellow,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TouristTheme.yellow))),
    );
  }
}
