import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:winhacks/screens/styles.dart';

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
                  'Suggested for you',
                  style: TextStyle(
                      fontFamily: "Roboto Bold",
                      color: Colors.white,
                      fontSize: 20),
                ),
              )),

              // Slider
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 230.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3)),
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
                              // Slider colour
                              color: Color(0xff493657)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image(
                                    // Temporary image for the slider
                                    // Be careful since the image needs to be an exact size right now
                                    image:
                                        AssetImage('assets/images/pancake.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Event Title $i',
                                    style: TextStyle(
                                        fontFamily: "Lato Bold",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          'Date $i',
                                          style: TextStyle(
                                              fontFamily: "Lato Bold",
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          'Time $i',
                                          style: TextStyle(
                                              fontFamily: "Lato Bold",
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

              // Sub Title 2
              Container(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: Text(
                  'Featured',
                  style: TextStyle(
                      fontFamily: "Roboto Bold",
                      color: Colors.white,
                      fontSize: 20),
                ),
              )),

              // Featured
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Container(
                  width: (MediaQuery.of(context).size.width) * 0.7,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      // Slider colour
                      color: Color(0xff493657)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Gesture Detection goes here

                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            // Temporary image for the slider
                            // Be careful since the image needs to be an exact size right now
                            image: AssetImage('assets/images/pancake.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Event Title x',
                            style: TextStyle(
                                fontFamily: "Lato Bold",
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: Text(
                                  'Date x',
                                  style: TextStyle(
                                      fontFamily: "Lato Bold",
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: Text(
                                  'Time x',
                                  style: TextStyle(
                                      fontFamily: "Lato Bold",
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
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
