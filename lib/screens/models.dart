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

    return Scaffold();
  }
}

// Categories model
categories() {
  return (Padding(
    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
    child: Container(
      width: 150,
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
              width: 30,
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
                    fontFamily: "Lato Bold", color: Colors.white, fontSize: 16),
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
  ));
}

// Organizers Model
organizers() {
  return (Padding(
    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
    child: Container(
      width: 350,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
          // Slider colour
          color: Color(0xff493657)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Gesture Detection goes here

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 70,
                height: 70,
                child: Image(
                  // Temporary image for the slider
                  // Be careful since the image needs to be an exact size right now
                  image: AssetImage('assets/images/pancake.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Second Container for all the information and button in column format
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Health and Wellness",
                        style: TextStyle(
                            fontFamily: "Lato Bold",
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Container(
                                height: 15,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print("test");
                                  },
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black87),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff5E4770)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              side: BorderSide(
                                                  color: Colors.white10)))),
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                        fontFamily: "Lato Regular",
                                        color: Colors.white,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                                "Creating a community for students to live a healthy lifestyle",
                                style: TextStyle(
                                    fontFamily: "Lato Regular",
                                    color: Colors.white,
                                    fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
    ),
  ));
}

topAppBar(String title, double screenWidth) {
  return Container(
      height: 105,
      // Add padding
      decoration: new BoxDecoration(
        color: Color(0xff493657),
      ),
      child: Row(children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              // Change this to children, add another container
              padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
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
            )),
        Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: title,
                    style: TextStyle(
                        fontFamily: "Lato Bold",
                        color: Colors.white,
                        fontSize: 25))
              ]),
            )),
      ]));
}

savedEvents() {
  return (Padding(
    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
    child: Container(
      width: 350,
      height: 170,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
          // Slider colour
          color: Color(0xff493657)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Gesture Detection goes here
            // Image
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 8, 15),
              child: Container(
                width: 100,
                height: 130,
                child: Image(
                  // Temporary image for the slider
                  // Be careful since the image needs to be an exact size right now
                  image: AssetImage('assets/images/pancake.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Second Container for all the information and button in column format
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Container(
                      width: 206,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      child: Text(
                        "Web Developer Workshop",
                        style: TextStyle(
                            fontFamily: "Lato Bold",
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),

                  // Time Icons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            // eventsList[i]['date']
                            "1:00 - 12:00 PM",
                            style: TextStyle(
                                fontFamily: "Lato Regular",
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Date Icons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            // eventsList[i]['date']
                            "Date",
                            style: TextStyle(
                                fontFamily: "Lato Regular",
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Location Icons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.white,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            // eventsList[i]['date']
                            "Science Building",
                            style: TextStyle(
                                fontFamily: "Lato Regular",
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    ),
  ));
}
