import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import './screens/home_screen.dart'
    show HomeScreen; // ./ Means it is in the same directory, helps with pathing

void main() => runApp(Home());

class Home extends StatelessWidget {
  Widget build(BuildContext contexxt) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
