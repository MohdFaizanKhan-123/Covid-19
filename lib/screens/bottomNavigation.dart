import 'package:covid/graph/India_graph.dart';
import 'package:covid/screens/HomePage.dart';
import 'package:covid/screens/india.dart';
import 'package:covid/screens/newWorld.dart';
import 'package:covid/screens/vaccination.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _page = 0;
  final pages = [
    HomePage(),
    VaccinationData(),
    IndiaData(),
    CountryPage(),
    IndiaGraph()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        buttonBackgroundColor: Color(0xffAB47BC),
        backgroundColor: Color(0xffF3E5F5),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: <Widget>[
          Text(
            "🌎",
            style: TextStyle(fontSize: 25.0),
          ),
          Text(
            "💉",
            style: TextStyle(fontSize: 25.0),
          ),
          Text(
            "📍",
            style: TextStyle(fontSize: 25.0),
          ),
          Text(
            "🎌",
            style: TextStyle(fontSize: 25.0),
          ),
          Image.asset(
            "images/graph.png",
            scale: 7,
          ),
        ],
        animationDuration: Duration(milliseconds: 200),
        height: 50.0,
      ),
      body: pages[_page],
    );
  }
}
