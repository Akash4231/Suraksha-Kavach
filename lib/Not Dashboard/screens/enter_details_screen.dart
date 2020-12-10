import 'package:covid19/Not%20Dashboard/Models/person.dart';
import 'package:covid19/Not%20Dashboard/widgets/date_picker.dart';
import 'package:covid19/Not%20Dashboard/widgets/gender_dropdown.dart';
import 'package:covid19/Not%20Dashboard/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
//import 'package:intl/intl.dart';
//import '../Models/date_time.dart';
import 'package:intl/intl.dart';
import '../../Dashboard/screens/home_screen.dart';

import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EnterDetails extends StatefulWidget {
  EnterDetails({Key key}) : super(key: key);

  @override
  _EnterDetailsState createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  final lastNameFocusNode = FocusNode();
  final aadharFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final stateFocusNode = FocusNode();
  final districtFocusNode = FocusNode();

  bool heart = false;
  bool diabetes = false;
  bool lung = false;
  bool tension = false;
  bool cancer = false;
  bool kidney = false;

  int priority = 0;
  int age;

  //Date datey;
  String dateString;

  var newPerson = Person(
      aadharNum: null,
      antibodyResult: -1,
      dateOfBirth: null,
      district: null,
      emailId: null,
      fName: null,
      gender: true,
      lName: null,
      phoneNum: null,
      priority: null,
      state: null,
      testResult: -1);

  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    lastNameFocusNode.dispose();
    aadharFocusNode.dispose();
    emailFocusNode.dispose();
    stateFocusNode.dispose();
    districtFocusNode.dispose();
    super.dispose();
  }

  void calculateAge() {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = newPerson.dateOfBirth;
    age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
  }

  void calcPriority() {
    if (heart) priority += 100;
    if (diabetes) priority += 80;
    if (lung) priority += 70;
    if (tension) priority += 65;
    if (cancer) priority += 60;
    if (kidney) priority += 50;

    calculateAge();

    if (age >= 60)
      priority += 100;
    else if (age >= 50 && age < 60)
      priority += 80;
    else if (age >= 40 && age < 50)
      priority += 70;
    else if (age >= 30 && age < 40)
      priority += 60;
    else if (age >= 20 && age < 30)
      priority += 50;
    else if (age >= 10 && age < 20)
      priority += 40;
    else if (age >= 0 && age < 10) priority += 30;

    if (newPerson.gender && age >= 50) priority += 50;
  }

  void _submitForm() {
    _form.currentState.save();

    setState(() {
      DateAndAge();
    });

    print("Submit");
    print(newPerson.fName);
    print(newPerson.aadharNum);
    print(newPerson.dateOfBirth);
    print(newPerson.gender);
    //print(newPerson.antibodyResult);

    dateString = new DateFormat.yMMMd().format(newPerson.dateOfBirth);

    addPersonToDB(newPerson);
  }

  void addPersonToDB(Person newPerson) {
    const personUrl =
        'https://surakshakavach-9dfc9.firebaseio.com/Persons.json';
    String gender = 'Male';
    if (newPerson.gender == true)
      gender = 'Male';
    else if (newPerson.gender == false) gender = 'Female';

    //newPerson.priority = 0;
    calcPriority();

    http
        .post(
      personUrl,
      body: json.encode(
        {
          'First Name': newPerson.fName,
          'Last Name': newPerson.lName,
          'Date Of Birth': dateString,
          'Gender': gender,
          'Aadhar Number': newPerson.aadharNum,
          'PhoneNumber': newPerson.phoneNum,
          'Email ID': newPerson.emailId,
          'District': newPerson.district,
          'State': newPerson.state,
          'Test Result': newPerson.testResult,
          'Antibody Result': newPerson.antibodyResult,
          'Priority': priority,
          'Vaccinated': 0,
        },
      ),
    )
        .then(
      (response) {
        var district = newPerson.district;
        var districtUrl =
            'https://surakshakavach-9dfc9.firebaseio.com/Districts/$district.json';
        http.post(
          districtUrl,
          body: json.encode(
            {
              'First Name': newPerson.fName,
              'Last Name': newPerson.lName,
              'Date Of Birth': dateString,
              'Gender': gender,
              'Aadhar Number': newPerson.aadharNum,
              'PhoneNumber': newPerson.phoneNum,
              'Email ID': newPerson.emailId,
              'District': newPerson.district,
              'State': newPerson.state,
              'Test Result': newPerson.testResult,
              'Antibody Result': newPerson.antibodyResult,
              'Priority': priority,
              'Vaccinated': 0,
            },
          ),
        );
      },
    ).then((response) {
      Navigator.of(context).pushNamed(
        HomeScreen.routeName,
        arguments: {'isPerson': true},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter Details',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Form(
                  key: _form,
                  child: new Column(
                    children: <Widget>[
                      new ListTile(
                        leading: const Icon(Icons.person),
                        title: new TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          decoration: new InputDecoration(
                            //hintText: "First Name",
                            labelText: "First Name",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(lastNameFocusNode);
                          },
                          onSaved: (value) {
                            newPerson = Person(
                              aadharNum: newPerson.aadharNum,
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: newPerson.district,
                              emailId: newPerson.emailId,
                              fName: value,
                              gender: newPerson.gender,
                              lName: newPerson.lName,
                              phoneNum: newPerson.phoneNum,
                              priority: newPerson.priority,
                              state: newPerson.state,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                      ),
                      new ListTile(
                        leading: const Icon(Icons.person),
                        title: new TextFormField(
                          focusNode: lastNameFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: new InputDecoration(
                            // hintText: "Last Name",
                            labelText: "Last Name",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),

                            border: OutlineInputBorder(),
                          ),
                          onSaved: (value) {
                            newPerson = Person(
                              aadharNum: newPerson.aadharNum,
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: newPerson.district,
                              emailId: newPerson.emailId,
                              fName: newPerson.fName,
                              gender: newPerson.gender,
                              lName: value,
                              phoneNum: newPerson.phoneNum,
                              priority: newPerson.priority,
                              state: newPerson.state,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                      ),
                      DateAndAge(
                        p: newPerson,
                      ),
                      GenderDropdown(
                        p: newPerson,
                      ),
                      new ListTile(
                        leading: const Icon(Icons.phone),
                        title: new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter your number",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(aadharFocusNode);
                          },
                          onSaved: (value) {
                            newPerson = Person(
                              aadharNum: newPerson.aadharNum,
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: newPerson.district,
                              emailId: newPerson.emailId,
                              fName: newPerson.fName,
                              gender: newPerson.gender,
                              lName: newPerson.lName,
                              phoneNum: int.parse(value),
                              priority: newPerson.priority,
                              state: newPerson.state,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                        // Only numbers can be entered
                      ),
                      new ListTile(
                        leading:
                            const Icon(Icons.account_balance_wallet_rounded),
                        title: new TextFormField(
                          focusNode: aadharFocusNode,
                          decoration: new InputDecoration(
                            labelText: "Enter your 12 digit Aadhar Number",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                          ],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(emailFocusNode);
                          },
                          onSaved: (value) {
                            newPerson = Person(
                              aadharNum: int.parse(value),
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: newPerson.district,
                              emailId: newPerson.emailId,
                              fName: newPerson.fName,
                              gender: newPerson.gender,
                              lName: newPerson.lName,
                              phoneNum: newPerson.phoneNum,
                              priority: newPerson.priority,
                              state: newPerson.state,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                      ),
                      new ListTile(
                        leading: const Icon(Icons.email),
                        title: new TextFormField(
                          focusNode: emailFocusNode,
                          decoration: new InputDecoration(
                            //hintText: "Email",
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(stateFocusNode);
                          },
                          onSaved: (value) {
                            newPerson = Person(
                              aadharNum: newPerson.aadharNum,
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: newPerson.district,
                              emailId: value,
                              fName: newPerson.fName,
                              gender: newPerson.gender,
                              lName: newPerson.lName,
                              phoneNum: newPerson.phoneNum,
                              priority: newPerson.priority,
                              state: newPerson.state,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                      ),
                      new ListTile(
                        leading: const Icon(Icons.home),
                        title: new TextFormField(
                          focusNode: stateFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: new InputDecoration(
                            //hintText: "State",
                            labelText: "State",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(districtFocusNode);
                          },
                          onSaved: (value) {
                            newPerson = Person(
                              aadharNum: newPerson.aadharNum,
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: newPerson.district,
                              emailId: newPerson.emailId,
                              fName: newPerson.fName,
                              gender: newPerson.gender,
                              lName: newPerson.lName,
                              phoneNum: newPerson.phoneNum,
                              priority: newPerson.priority,
                              state: value,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                      ),
                      new ListTile(
                        leading: const Icon(Icons.room),
                        title: new TextFormField(
                          focusNode: districtFocusNode,
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
                            newPerson = Person(
                              aadharNum: newPerson.aadharNum,
                              antibodyResult: newPerson.antibodyResult,
                              dateOfBirth: newPerson.dateOfBirth,
                              district: value,
                              emailId: newPerson.emailId,
                              fName: newPerson.fName,
                              gender: newPerson.gender,
                              lName: newPerson.lName,
                              phoneNum: newPerson.phoneNum,
                              priority: newPerson.priority,
                              state: newPerson.state,
                              testResult: newPerson.testResult,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      new ListTile(
                        title: Text(
                          "Select Your Pre-Existing Medical Conditions",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      new ListTile(
                        //leading: const Icon(Icons.local_hospital),
                        title: Column(
                          children: [
                            CheckboxListTile(
                              secondary: const Icon(Icons.local_hospital),
                              title: const Text('Heart Disease'),
                              subtitle: Text(
                                  'Check if you have any type of heart disease'),
                              value: heart,
                              onChanged: (bool value) {
                                setState(() {
                                  heart = !heart;
                                });
                              },
                            ),
                            CheckboxListTile(
                              secondary: const Icon(Icons.local_hospital),
                              title: const Text('Diabetes'),
                              subtitle: Text(
                                  'Check if you have any type of diabetes'),
                              value: diabetes,
                              onChanged: (bool value) {
                                setState(() {
                                  diabetes = !diabetes;
                                });
                              },
                            ),
                            CheckboxListTile(
                              secondary: const Icon(Icons.local_hospital),
                              title: const Text('Respiratory Disease'),
                              subtitle: Text(
                                  'Check if you have any type of respiratory disease'),
                              value: lung,
                              onChanged: (bool value) {
                                setState(() {
                                  lung = !lung;
                                });
                              },
                            ),
                            CheckboxListTile(
                              secondary: const Icon(Icons.local_hospital),
                              title: const Text('Hyper Tension'),
                              subtitle: Text('Check if you have hypertension'),
                              value: tension,
                              onChanged: (bool value) {
                                setState(() {
                                  tension = !tension;
                                });
                              },
                            ),
                            CheckboxListTile(
                              secondary: const Icon(Icons.local_hospital),
                              title: const Text('Cancer'),
                              subtitle:
                                  Text('Check if you have any type of cancer'),
                              value: cancer,
                              onChanged: (bool value) {
                                setState(() {
                                  cancer = !cancer;
                                });
                              },
                            ),
                            CheckboxListTile(
                              secondary: const Icon(Icons.local_hospital),
                              title: const Text('Kindey Disease'),
                              subtitle: Text(
                                  'Check if you have any type of kidney disease'),
                              value: kidney,
                              onChanged: (bool value) {
                                setState(() {
                                  kidney = !kidney;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: _submitForm,
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
                            fontSize: 20, fontWeight: FontWeight.w900)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
