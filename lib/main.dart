import 'package:flutter/material.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/pages/home.dart';
import 'package:tourist/pages/login.dart';
import 'package:tourist/pages/poi_view.dart';
import 'package:tourist/pages/profile_view.dart';
import 'package:tourist/session.dart';
import 'package:tourist/theme.dart';

void main() async {
  runApp(Tourist());
}

class Tourist extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _TouristState createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  _TouristState() {
    Session.onLogin = refreshLogin;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historical Routes',
      theme: ThemeData(scaffoldBackgroundColor: TouristTheme.backgroundColor),
      routes: {
        '/poiView': (context) => POIView(PointOfInterest.carnaxide),
        '/search': (context) => POIView(PointOfInterest.sjorge),
        '/route': (context) => POIView(PointOfInterest.terreiro),
        '/profile': (context) => ProfileView(),
      },
      home: FutureBuilder(
        future: Session.isLoggedIn(),
        builder: (context, snapshot) =>
            snapshot.data != null && snapshot.data ? Home() : Login(),
      ),
    );
  }

  void refreshLogin() {
    setState(() {});
  }
}
