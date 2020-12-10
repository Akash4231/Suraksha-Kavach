import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl_browser.dart';
//import '../screens/enter_details_screen.dart';
//import '../Models/date_time.dart';
import '../Models/person.dart';

class DateAndAge extends StatefulWidget {
  // DateAndAge({Key key}) : super(key: key);

  final Person p;

  DateAndAge({Key key, this.p}) : super(key: key);

  @override
  DateAndAgeState createState() => DateAndAgeState();
}

class DateAndAgeState extends State<DateAndAge> {
  DateTime dateTime;
  String dateString;

  //dateTime=widget.date;

  RaisedButton calDate() {
    return RaisedButton(
      child: Text("Date of Birth"),
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: dateTime == null ? DateTime.now() : dateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then(
          (date) {
            setState(
              () {
                dateTime = date;
                widget.p.dateOfBirth = dateTime;
                dateString = new DateFormat.yMMMd().format(dateTime);
                print(widget.p.dateOfBirth);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.date_range),
      title: dateTime == null
          ? calDate()
          : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dateString),
                  calDate(),
                ],
              ),
            ),
    );
  }
}
