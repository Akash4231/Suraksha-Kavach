//import 'dart:html';

//import 'dart:convert';
//import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;

class Person {
  final String fName;
  final String lName;
  DateTime dateOfBirth;
  String dateString;
  bool gender = true; //true=male, false=female
  final int phoneNum;
  final int aadharNum;
  final String emailId;
  final String id;
  final String state;
  final String district;

  int testResult; //-1=not conducted, 0=covid +ve, 1=covid -ve
  int antibodyResult; //-1=not conducted, 0=antibody present, 1=antibody absent
  int priority = 0;
  int vaccinated = 0;

  bool selectedForVaccination =
      false; //it will become true only when the person is selected after generating the priority order

  Person({
    //to-do @required stuff
    this.id,
    this.fName,
    this.lName,
    this.dateOfBirth,
    this.dateString,
    this.gender,
    this.district,
    this.state,
    this.testResult,
    this.aadharNum,
    this.antibodyResult,
    this.priority,
    this.phoneNum,
    this.emailId,
  });

  factory Person.fromJson(Map<String, dynamic> value) {
    return Person(
      fName: value['First Name'],
      lName: value['Last Name'],
      dateOfBirth: value['Date Of Birth'],
      gender: value['Gender'],
      aadharNum: value['Aadhar Number'],
      phoneNum: value['PhoneNumber'],
      emailId: value['Email ID'],
      //district: district,
      state: value['State'],
      testResult: value['Test Result'],
      antibodyResult: value['Antibody Result'],
      priority: value['Priority'],
      //vaccinated:value['Vaccinated']
    );
  }

  //int retPriority(){

  //}

}
