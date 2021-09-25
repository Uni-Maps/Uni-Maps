import 'package:flutter/material.dart';
import 'package:winhacks/screens/gmap.dart';
import 'package:winhacks/screens/user_page.dart';

class Navigation_Bar extends StatefulWidget {
  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  // Bottom navigation bar index
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    // Different pages here
    // User_Page(),
    // GMap(),
    // Calendar(),
    // Saved()

    User_Page(),
    GMap(),
    Text("Calendar"),
    Text("Saved"),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Map"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Calendar"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Saved"),
          )
        ],
        backgroundColor: Color(0xff493657),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTap,
      ),
    );
  }
}
