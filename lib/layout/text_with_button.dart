import 'package:flutter/material.dart';
import 'package:tourist/layout/button.dart';
import 'package:tourist/layout/text_box.dart';
import 'package:tourist/theme.dart';

class TextWithButton extends StatelessWidget {
  final TextEditingController controller;
  final Function onClick;
  final String placeholder;

  TextWithButton({this.controller, this.onClick, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextBox(
              controller: controller,
              color: TouristTheme.white,
              placeholder: placeholder,
            ),
          ),
          Button(
            icon: Icons.send,
            color: TouristTheme.yellow,
            onPressed: onClick,
          )
        ],
      ),
    );
  }
}
