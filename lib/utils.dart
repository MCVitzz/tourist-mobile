import 'package:flutter/material.dart';

class Utils {
  static String doubleToString(n) {
    if (n > 1000000) {
      double simple = n / 1000;
      return simple.toString().substring(0, 3).replaceAll('.0', '') + 'M';
    } else if (n > 1000) {
      double simple = n / 1000;
      return simple.toString().substring(0, 3).replaceAll('.0', '') + 'k';
    } else
      return n.toString();
  }

  static void toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  static void pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  static void popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
