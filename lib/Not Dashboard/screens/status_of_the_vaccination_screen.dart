import 'package:covid19/Not%20Dashboard/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class StatusOfVaccine extends StatelessWidget {
  const StatusOfVaccine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status of Vaccination',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: MainDrawer(),
      body: Text("Status of The Vaccination Screen"),
    );
  }
}
