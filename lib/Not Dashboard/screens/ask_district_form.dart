//import 'package:covid19/Not%20Dashboard/screens/govt_main_screen.dart';
import 'package:covid19/Not%20Dashboard/screens/sample_govt_screen.dart';
import 'package:covid19/Not%20Dashboard/widgets/govt_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
//import 'package:provider/provider.dart';
//import 'package:covid19/Not%20Dashboard/Providers/persons_provider.dart';

class AskDistrictForm extends StatefulWidget {
  @override
  _AskDistrictFormState createState() => _AskDistrictFormState();
}

class _AskDistrictFormState extends State<AskDistrictForm> {
  final _form = GlobalKey<FormState>();

  String district;

  void _submitForm() {
    _form.currentState.save();
    print(district);

    Navigator.of(context).pushNamed(SampleGovtScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter the District',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: GovtDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Column(
          children: [
            Form(
              key: _form,
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
                    setState(() {
                      district = value;
                    });
                    // district = value;
                  },
                ),
              ),
            ),
            RaisedButton(
              onPressed: _submitForm,
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
          ],
        ),
      ),
    );
  }
}
