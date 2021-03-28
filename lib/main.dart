import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:winhacks/home_screen.dart' show HomeScreen;

void main() => runApp(Home());

class Home extends StatelessWidget {
  Widget build(BuildContext contexxt) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
