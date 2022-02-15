import 'package:flutter/material.dart';
import 'package:winhacks/screens/calender/calenderPage.dart';
import 'package:winhacks/screens/map/gmap.dart';
import 'package:winhacks/screens/home/userPage.dart';
import 'package:winhacks/screens/saved/savedPage.dart';
import 'package:winhacks/screens/saved/savedTab.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  // Bottom navigation bar index
  int _selectedIndex = 0;

  // Nav bar pages
  List<Widget> _widgetOptions = <Widget>[
    UserPage(),
    GMap(),
    CalenderPage(),
    SavedTab(),
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
