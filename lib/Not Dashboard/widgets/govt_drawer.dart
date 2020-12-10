//import 'package:covid19/Dashboard/screens/home_screen.dart';

import 'package:covid19/Not%20Dashboard/screens/ask_district_form.dart';
//import 'package:covid19/Not%20Dashboard/screens/govt_main_screen.dart';
import 'package:flutter/material.dart';

class GovtDrawer extends StatelessWidget {
  const GovtDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.cyan[800],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              //listtile 1
              leading: Icon(
                Icons.assessment_rounded,
                color: Colors.black,
                size: 26,
              ),
              title: Text(
                'Main Screen',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    color: Colors.cyan[800]),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return AskDistrictForm();
                    },
                  ),
                );
              }),
          ListTile(
            //listtile 1
            leading: Icon(
              Icons.assessment_rounded,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              'Current Status',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  color: Colors.cyan[800]),
            ),
            onTap: () {},
          ),
          ListTile(
            //listtile 1
            leading: Icon(
              Icons.assessment_rounded,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              "Today's Appointments",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  color: Colors.cyan[800]),
            ),
            onTap: () {},
          ),
          ListTile(
            //listtile 1
            leading: Icon(
              Icons.assessment_rounded,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              'My Details',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  color: Colors.cyan[800]),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

/*body: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Column(
          children: [
            Form(
              child: ListTile(
                leading: Icon(Icons.location_city),
                title: TextFormField(
                  //focusNode: districtFocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: new InputDecoration(
                    labelText: "District",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    Navigator.of(context).pushNamed(
                      DisplayAfterPriority.routeName,
                      arguments: {'district': value},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      

      RaisedButton(
                onPressed: _submitForm,
                //textColor: Colors.white,
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Submit Now',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
              ),
      
      */
