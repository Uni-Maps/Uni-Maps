import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class User_Page extends StatefulWidget {
  final Function toggleView;
  User_Page({this.toggleView});

  @override
  _UserPage_State createState() => _UserPage_State();
}

class _UserPage_State extends State<User_Page> {
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
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
              iconSize: 40,
            ),
            Container(
                // Add search bar in here

                ),
          ],
          backgroundColor: Color(0xff493657),
        ),

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

          // Uni-Maps Title
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            color: Colors.blue),
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
