import 'package:covid19/Not%20Dashboard/widgets/govt_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class SampleGovtScreen extends StatelessWidget {
  static const routeName = '/sampleGOvtScreen';
  final List<int> abc = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: GovtDrawer(),
      body: ListView(children: [
        CustomListTile(
          name: "Akash Yadav",
          priority: "Priority: 480",
        ),
        CustomListTile(
          name: "Nishchay Gupta",
          priority: "Priority: 450",
        ),
        CustomListTile(
          name: "Utkarsh Tyagi",
          priority: "Priority: 400",
        ),
        CustomListTile(
          name: "Chetan Bansal",
          priority: "Priority: 380",
        ),
        CustomListTile(
          name: "Harsh Sharma",
          priority: "Priority: 350",
        ),
        CustomListTile(
          name: "Sandeep Kumar",
          priority: "Priority: 320",
        ),
        CustomListTile(
          name: "Virat Kohli",
          priority: "Priority: 290",
        ),
        CustomListTile(
          name: "Rohit Sharma",
          priority: "Priority: 270",
        ),
      ]),
    );
  }
}

class CustomListTile extends StatefulWidget {
  final String name;
  final String priority;

  CustomListTile({this.name, this.priority});

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool sent = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(
        widget.name,
        style: TextStyle(
            fontWeight: FontWeight.w900, letterSpacing: 1.5, fontSize: 20),
      ),
      subtitle: Text(widget.priority),
      trailing: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: sent
                ? MaterialStateProperty.all<Color>(Colors.red)
                : MaterialStateProperty.all<Color>(Colors.blue)),
        child: sent
            ? Text(
                "Undo Notification",
                style: TextStyle(color: Colors.white),
              )
            : Text(
                "Send Notification",
                style: TextStyle(color: Colors.white),
              ),
        onPressed: () {
          setState(() {
            sent = !sent;
          });
        },
      ),
    );
  }
}
