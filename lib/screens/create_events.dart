import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';

class Create_Events extends StatefulWidget {
  final Function toggleViewLogin;

  Create_Events({this.toggleViewLogin});

  @override
  _Create_EventsState createState() => _Create_EventsState();
}

class _Create_EventsState extends State<Create_Events> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            child: Form(
                child: Stack(children: <Widget>[
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

      Container(
          child: Column(children: <Widget>[
        // Top App Bar Container
        Container(
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
                          text: "Create Events",
                          style: TextStyle(
                              fontFamily: "Lato Bold",
                              color: Colors.white,
                              fontSize: 25))
                    ]),
                  )),
            ])),

        // Container that has all the input boxes
        Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              // Add padding and change colours
              decoration: new BoxDecoration(
                  color: Color(0xff493657),
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  children: <Widget>[
                    // Event Name Input Box
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              labelText: 'Event Name',
                              labelStyle: TextStyle(color: Colors.white)),
                        )),

                    // Event description
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              labelText: 'Event Description',
                              labelStyle: TextStyle(color: Colors.white)),
                        ))
                    // Date
                    // Location Drop Down
                    // Category Drop Down
                  ],
                ),
              ),
            ))
      ]))
    ]))));
  }
}
