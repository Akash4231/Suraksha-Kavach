import 'package:covid19/Authentication/otpScreen.dart';
import 'package:covid19/Not%20Dashboard/screens/govt_main_screen.dart';
import 'package:covid19/Not%20Dashboard/screens/sample_govt_screen.dart';
//import 'package:covid19/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'Dashboard/screens/home_screen.dart';
import 'authentication_screen.dart';
import 'package:provider/provider.dart';
import 'Not Dashboard/Providers/persons_provider.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

//import 'package:shared_preferences/shared_preferences.dart';
//import 'Authentication/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences preferences = await SharedPreferences.getInstance();
  //String isLoggedIn = preferences.getString('isLoggedIn');
  runApp(MaterialApp(
    //home: isLoggedIn == "successful login" ? HomeScreen() : LoginScreen(),

    home: AuthenticationScreen(),

    routes: {
      HomeScreen.routeName: (ctx) => HomeScreen(),
      OtpScreen.routeName: (BuildContext ctx) => OtpScreen(),
      SampleGovtScreen.routeName: (BuildContext ctx) => SampleGovtScreen(),
      DisplayAfterPriority.routeName: (BuildContext ctx) =>
          DisplayAfterPriority(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PersonsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Authentication Screen',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.white),
          ),
        ),
        backgroundColor: HexColor('#F2F3F8'),
        //drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.only(top: 250, left: 100),
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('Person'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      HomeScreen.routeName,
                      arguments: {'isPerson': true},
                    );
                  }),
              RaisedButton(
                  child: Text('Government Official'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      HomeScreen.routeName,
                      arguments: {'isPerson': false},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
