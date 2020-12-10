import 'package:covid19/Dashboard/screens/home_screen.dart';

import 'package:flutter/material.dart';

import '../screens/enter_details_screen.dart';
import '../screens/apply_antibody_test_screen.dart';
import '../screens/apply_covid_test_screen.dart';
import '../screens/apply_vaccine_screen.dart';
import '../screens/status_of_the_vaccination_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

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
            /* child: Text(
              'Options',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 45,
                  color: Colors.black),
              textAlign: TextAlign.justify,
            ),*/
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
              'Dashboard',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  color: Colors.cyan[800]),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName,
                arguments: {'isPerson': true},
              );
            },
          ),
          ListTile(
            //listtile 1
            leading: Icon(
              Icons.add_moderator,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              'Enter Details',
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
                    return EnterDetails();
                  },
                ),
              );
            },
          ),
          ListTile(
            //listtile 2
            leading: Icon(
              Icons.assignment_turned_in_rounded,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              'Apply for Covid Test',
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
                    return ApplyCovidTestScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            //listtile 3
            leading: Icon(
              Icons.assignment_turned_in_rounded,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              'Apply for Antibody Test',
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
                    return ApplyAntibodyTest();
                  },
                ),
              );
            },
          ),
          ListTile(
            //listtile 4
            leading: Icon(
              Icons.assignment_turned_in_rounded,
              color: Colors.black,
              size: 26,
            ),
            title: Text(
              'Apply for the Vaccine',
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
                    return ApplyVaccine();
                  },
                ),
              );
            },
          ),
          ListTile(
            //listtile 5

            leading: Icon(
              Icons.local_hospital_rounded,
              color: Colors.black,
              size: 26,
            ),

            title: Text(
              'Status of Vaccination',
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
                    return StatusOfVaccine();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
