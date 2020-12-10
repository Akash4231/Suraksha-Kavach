//import 'package:covid19/Not%20Dashboard/widgets/main_drawer.dart';
//import 'package:covid19/Not%20Dashboard/Models/person.dart';
import 'package:covid19/Not%20Dashboard/Providers/persons_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:provider/provider.dart';

import 'Dashboard/screens/home_screen.dart';
//import './Not Dashboard/Providers/persons_provider.dart';
//import 'package:provider/provider.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PersonsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Authentication Screen',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.white),
          ),
        ),
        backgroundColor: HexColor('#F2F3F8'),
        //drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.only(top: 250, left: 100),
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('Person'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      HomeScreen.routeName,
                      arguments: {'isPerson': true},
                    );
                  }),
              RaisedButton(
                  child: Text('Government Official'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      HomeScreen.routeName,
                      arguments: {'isPerson': false},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
