import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/layout/nav_bar.dart';
import 'package:tourist/pages/poi_view.dart';
import 'package:tourist/pages/profile_view.dart';
import 'package:tourist/services/providers/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PointOfInterest _poi = PointOfInterest.sjorge;
  Widget activeScreen = POIView(PointOfInterest.carnaxide);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Tourist',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 32),
          ),
        ),
      ),
      body: activeScreen,
      bottomNavigationBar: NavBar(Icons.map, Icons.search, Icons.room_outlined,
          Icons.person, Icons.qr_code_sharp, fabPressed, changedMenu),
    );
  }

  void fabPressed() async {
    String scanned = await BarcodeScanner.scan();
    PointOfInterest poi = await Provider.getPOI(scanned);
    setState(() {
      _poi = poi;
    });
  }

  void changedMenu(idx) {
    Widget nextScreen = activeScreen;
    switch (idx) {
      case 0:
        nextScreen = POIView(_poi);
        break;
      case 1:
        nextScreen = POIView(_poi);
        break;
      case 2:
        nextScreen = POIView(_poi);
        break;
      case 3:
        nextScreen = ProfileView();
        break;
    }
    setState(() {
      this.activeScreen = nextScreen;
    });
  }
}
