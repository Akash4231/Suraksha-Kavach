import 'package:flutter/material.dart';
import '../Models/person.dart';

class GenderDropdown extends StatefulWidget {
  final Person p;
  GenderDropdown({Key key, this.p}) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  int dropValue = 1;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person_add),
      title: Text("Gender: "),
      //visualDensity: VisualDensity(horizontal: -5, vertical: 0),
      trailing: Container(
        child: DropdownButton(
          value: dropValue,
          onChanged: (value) {
            setState(
              () {
                dropValue = value;
                //print(dropValue);
                if (dropValue == 1) {
                  widget.p.gender = true;
                } else {
                  widget.p.gender = false;
                }
                print(widget.p.gender);
              },
            );
          },
          items: [
            DropdownMenuItem(
              child: Text("Male"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Female"),
              value: 2,
            ),
            //DropdownMenuItem(child: Text("Can't Say!"), value: 3),
          ],
        ),
      ),
    );
  }
}
