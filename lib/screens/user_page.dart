import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class User_page extends StatefulWidget {
  final Function toggleView;
  User_page({this.toggleView});

  @override
  _Userpage_State createState() => _Userpage_State();
}

class _Userpage_State extends State<User_page> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String username = '';
  String email = '';
  String password = '';
  String error = '';

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(

        // Add members in here
        resizeToAvoidBottomInset: false,
        // Stacks the members so that everything else appears above the background
        body: Stack(children: <Widget>[
          // Stretches the widget to the entire screen is what Expanded does

          Container(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      // Background Image
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.fill)),
            ),
          ),

          // Back button
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 45, 15, 0),
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    print("line 58");
                  },
                  iconSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Uni-Maps Title
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
        ]));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
