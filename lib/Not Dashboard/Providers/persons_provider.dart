import 'package:flutter/material.dart';

import '../Models/person.dart';
import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PersonsProvider with ChangeNotifier {
  List<Person> _personsList = [];

  List<Person> get list {
    //return [..._personsList];
    return _personsList;
  }

  Future<void> fetchAndSetPersons(String dis) async {
    //Person fetchedData;
    final String district = dis;
    Map<String, dynamic> extractedData;

    final url =
        "https://surakshakavach-9dfc9.firebaseio.com/Districts/$district.json";
    //final url = "https://surakshakavach-9dfc9.firebaseio.com/Districts/Lucknow";

    final response = await http.get(url);

    /*if (response.statusCode == 200) {
      fetchedData = Person.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data from Firebase');
    }

    print(fetchedData);
    print(response.statusCode);
    print(response.body);*/

    try {
      extractedData = json.decode(response.body) as Map<String, dynamic>;
      //print(extractedData);
    } catch (error) {
      throw error;
    }

    extractedData.forEach((key, value) {
      _personsList.add(Person(
        id: key,
        //aadharNum: value['Aadhar Number'],
        //antibodyResult: value[''],
        fName: value['First Name'],
        lName: value['Last Name'],
        dateString: value['Date Of Birth'],

        gender: value['Gender'] == 'Male' ? true : false,
        aadharNum: value['Aadhar Number'],
        phoneNum: value['PhoneNumber'],
        emailId: value['Email ID'],
        district: district,
        state: value['State'],
        testResult: value['Test Result'],
        antibodyResult: value['Antibody Result'],
        priority: value['Priority'],
        //vaccinated:value['Vaccinated'],
      ));
    });

    print(_personsList[0].aadharNum);
  }
}
