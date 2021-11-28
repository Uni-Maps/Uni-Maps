import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:winhacks/models/models.dart';

class Organization_Details extends StatefulWidget {
  // final Function toggleView;
  // Saved_Page({this.toggleView});

  @override
  _OrganizationDetails_State createState() => _OrganizationDetails_State();
}

class _OrganizationDetails_State extends State<Organization_Details> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = 'Organizations';

    return Scaffold(
        // Add members in here
        resizeToAvoidBottomInset: false,
        // Stacks the members so that everything else appears above the background
        body: Stack(
          children: <Widget>[
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
            // Top App Bar
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  topAppBar(title, screenWidth),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        // Image Size Adjustments
                        width: screenWidth,
                        height: screenHeight / 3.5,
                        child: Image(
                          image: AssetImage(
                              'assets/images/health_and_wellness.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  // Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Text(
                      // Change the name for each event
                      'Health and Wellness',
                      style: TextStyle(
                          fontFamily: "Roboto Bold",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  // Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      // Change the name for each event
                      '594 Members',
                      style: TextStyle(
                          fontFamily: "Roboto Regular",
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ),
                  // Join Group Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Container(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              // Fix the size later
                              "     Join this Group     ",
                              style: TextStyle(fontSize: 14),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff493657)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(
                                            color: Colors.white10)))),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      // Change the number of events
                      'Events',
                      style: TextStyle(
                          fontFamily: "Roboto Bold",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  events(),
                  events(),
                ]))
          ],
        ));
  }
}
