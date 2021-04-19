import 'package:flutter/material.dart';
import 'package:hr/layout/button.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String message = 'Júlio Miguel';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historical Routes'),
      ),
      body: Center(
        child: Column(children: [
          Button(
              onPressed: () async {
                String codeSanner = await BarcodeScanner.scan();
                setState(() {
                  message = codeSanner;
                });
              },
              text: 'Test'),
          Text(
            message,
            style: TextStyle(color: Colors.black),
          )
        ]),
      ),
    );
  }
}
