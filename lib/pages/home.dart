import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:tourist/data/poi.dart';
import 'package:tourist/layout/nav_bar.dart';
import 'package:tourist/pages/poi_view.dart';

class Home extends StatelessWidget {
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
      body: POIView(POI.terreiro),
      bottomNavigationBar: NavBar(
          Icons.map,
          '/poiView',
          Icons.search,
          '/search',
          Icons.room_outlined,
          '/route',
          Icons.person,
          '/profile',
          Icons.qr_code_sharp,
          fabPressed),
    );
  }

  void fabPressed() async {
    String scanned = await BarcodeScanner.scan();
  }
}
