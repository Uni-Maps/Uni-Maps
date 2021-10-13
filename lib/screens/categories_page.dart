import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:winhacks/screens/styles.dart';
import 'package:winhacks/screens/models.dart';

class Categories_Page extends StatefulWidget {
  final Function toggleView;
  Categories_Page({this.toggleView});

  @override
  _CategoriesPage_State createState() => _CategoriesPage_State();
}

class _CategoriesPage_State extends State<Categories_Page> {
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
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
              iconSize: 35,
            ),
            actions: <Widget>[
              // Search bar
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  iconSize: 0,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
                iconSize: 35,
              ),
            ],
            backgroundColor: Color(0xff493657),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(35),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white54,
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: "Lato Regular"),
                      ),
                      onPressed: () {
                        print("Line 200");
                        // widget.toggleViewForgotPassword();
                      },
                      child: Text('Your page'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white54,
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: "Lato Regular"),
                      ),
                      onPressed: () {
                        print("Line 200");
                        // widget.toggleViewForgotPassword();
                      },
                      child: Text('Categories'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white54,
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: "Lato Regular"),
                      ),
                      onPressed: () {
                        print("Line 200");
                        // widget.toggleViewForgotPassword();
                      },
                      child: Text('Organizers'),
                    ),
                  ],
                ))),

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

          // Sub Title 1
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: Text(
                  'Browse by Category',
                  style: TextStyle(
                      fontFamily: "Roboto Bold",
                      color: Colors.white,
                      fontSize: 20),
                ),
              )),

              // Categories
              Column(
                children: [
                  Row(
                    children: [categories(), categories()],
                  ),
                  Row(
                    children: [categories(), categories()],
                  ),
                  Row(
                    children: [categories(), categories()],
                  ),
                  Row(
                    children: [categories(), categories()],
                  )
                ],
              ),
            ],
          ),
        ]));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
