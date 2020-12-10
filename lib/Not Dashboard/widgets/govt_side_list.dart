import 'package:covid19/Not%20Dashboard/Providers/persons_provider.dart';
import 'package:flutter/material.dart';
//import '../Models/person.dart';
import 'package:provider/provider.dart';

class ListGovtSide extends StatelessWidget {
  //final List<Person> personList;

  @override
  Widget build(BuildContext context) {
    final personObject = Provider.of<PersonsProvider>(context);

    final personList = personObject.list;

    return new ListView.builder(
      itemCount: personList.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return ListTile(
          title: Text(personList[index].fName),
        );
      },
    );
  }
}
