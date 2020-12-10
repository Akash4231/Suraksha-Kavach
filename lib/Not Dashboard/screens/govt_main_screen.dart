//import 'package:covid19/Not%20Dashboard/Models/person.dart';
//import 'package:covid19/Not%20Dashboard/Providers/persons_provider.dart';
import 'package:covid19/Not%20Dashboard/widgets/govt_drawer.dart';
import 'package:covid19/Not%20Dashboard/widgets/govt_side_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
//import 'package:http/';
//import 'dart:convert';
//import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
//import 'package:provider/provider.dart';

class DisplayAfterPriority extends StatefulWidget {
  static const routeName = '/displayAfterPriority';
  DisplayAfterPriority({Key key}) : super(key: key);

  @override
  _DisplayAfterPriorityState createState() => _DisplayAfterPriorityState();
}

class _DisplayAfterPriorityState extends State<DisplayAfterPriority> {
  String district; //isme text aa chuka hai ab aageimplement kro
  //List<Person> personList = []; //yahi hai main list jo display hogi

  @override
  void initState() {
    super.initState();
    //Provider.of<PersonsProvider>(context, listen: false)
    //  .fetchAndSetPersons(district);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    district = routeArgs['district'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: GovtDrawer(),
      body: ListGovtSide(),
    );
  }
}
