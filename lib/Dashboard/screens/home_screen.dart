import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'summary_statistics_screen.dart';
import 'countries_statistics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Not Dashboard/widgets/main_drawer.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import '../../Not Dashboard/widgets/govt_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  //final bool isPerson;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, bool>;

    final isPerson = routeArgs['isPerson'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DashBoard',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('#F2F3F8'),
      drawer: isPerson ? MainDrawer() : GovtDrawer(),
      body: SafeArea(
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: <Widget>[
              SummaryStatisticsScreen(),
              CountriesStatisticsScreen()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentPage,
        onItemSelected: (index) {
          setState(() {
            _currentPage = index;
          });
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Summary'),
              icon: Icon(Icons.home),
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              title: Text('Countries'),
              icon: Icon(Icons.list),
              textAlign: TextAlign.center)
        ],
        showElevation: false,
        backgroundColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
