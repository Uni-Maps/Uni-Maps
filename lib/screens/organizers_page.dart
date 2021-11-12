import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/screens/models.dart';

class Organizers_Page extends StatefulWidget {
  final Function toggleView;
  Organizers_Page({this.toggleView});

  @override
  _OrganizersPage_State createState() => _OrganizersPage_State();
}

class _OrganizersPage_State extends State<Organizers_Page> {
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

          // Sub Title 1
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: Text(
                  'Who to follow',
                  style: TextStyle(
                      fontFamily: "Roboto Bold",
                      color: Colors.white,
                      fontSize: 20),
                ),
              )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    'Follow the most popular organizers and get notified when they post events',
                    style: TextStyle(
                        fontFamily: "Roboto Regular",
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
              ),

              // Categories
              Column(
                children: [
                  Row(
                    children: [organizers()],
                  ),
                  Row(
                    children: [organizers()],
                  ),
                  Row(
                    children: [organizers()],
                  ),
                  Row(
                    children: [organizers()],
                  )
                ],
              ),
            ],
          ),
        ]));
  }
}
