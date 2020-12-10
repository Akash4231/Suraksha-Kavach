import 'package:covid19/Not%20Dashboard/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:url_launcher/url_launcher.dart';

class ApplyAntibodyTest extends StatelessWidget {
  final bool isSelected =
      false; //if the person is selected after running priority algo then only he can apply for covid test
  //ApplyCovidTest(this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apply For Covid Test',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: MainDrawer(),
      body: isSelected
          ? ListTile(
              title: Congrats(),
            )
          : ListTile(
              title: Wait(),
            ),
    );
  }
}

class Wait extends StatelessWidget {
  const Wait({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Card(
        shadowColor: Colors.redAccent,
        elevation: 20,
        child: Container(
          color: Colors.redAccent,
          height: 300,
          width: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: GestureDetector(
              child: Card(
                child: Container(
                  color: Colors.red[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Text(
                          "\n\nAwaiting Antibody Test results",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.red[900],
                            letterSpacing: 0,
                            //height: 10,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onLongPress: () {
                //launch(('tel:7388188369'));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Congrats extends StatelessWidget {
  const Congrats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Card(
        shadowColor: Colors.blue,
        elevation: 20,
        child: Container(
          color: Colors.lightBlue,
          height: 300,
          width: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: GestureDetector(
              child: Card(
                child: Container(
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Antibodies Found !!",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.indigo[900],
                            letterSpacing: 0.1,
                            //height: 10,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "You dont need vaccination!",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.indigo[900],
                            letterSpacing: 0.1,
                            //height: 10,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onLongPress: () {
                launch(('tel:1075'));
              },
            ),
          ),
        ),
      ),
    );
  }
}

//onPressed: () {
//launch(('tel:7388188369'));
//},
