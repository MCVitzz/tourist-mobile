import 'package:flutter/material.dart';
import 'package:tourist/theme.dart';

class FABIcon extends StatefulWidget {
  Function onPressed;
  IconData icon;

  FABIcon({this.onPressed, this.icon});

  @override
  _FABIconState createState() => _FABIconState();
}

class _FABIconState extends State<FABIcon> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: this.widget.onPressed,
        backgroundColor: TouristTheme.fabBackgroundColor,
        child: Icon(
          this.widget.icon,
          color: TouristTheme.fabColor,
        ));
  }
}
