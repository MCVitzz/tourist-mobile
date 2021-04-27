import 'package:flutter/material.dart';
import 'package:tourist/data/poi.dart';
import 'package:tourist/pages/home.dart';
import 'package:tourist/pages/poi_view.dart';
import 'package:tourist/theme.dart';

void main() {
  runApp(Tourist());
}

class Tourist extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historical Routes',
      theme: ThemeData(scaffoldBackgroundColor: TouristTheme.backgroundColor),
      routes: {
        '/poiView': (context) => POIView(POI.carnaxide),
      },
      home: Home(),
    );
  }
}
