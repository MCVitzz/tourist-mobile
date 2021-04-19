import 'package:flutter/material.dart';
import 'package:hr/pages/home.dart';

void main() {
  runApp(Tourist());
}

class Tourist extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historical Routes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
