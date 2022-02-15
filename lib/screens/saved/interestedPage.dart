import 'package:flutter/material.dart';
import 'package:winhacks/models/models.dart';

class InterestedPage extends StatefulWidget {
  // final Function toggleView;
  // Interested_Page({this.toggleView});

  @override
  _InterestedPageState createState() => _InterestedPageState();
}

class _InterestedPageState extends State<InterestedPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width * 0.8;
    String title = 'Saved';

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
                  topAppBarEmpty(title, screenWidth),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Text(
                      // Change the number of events
                      '3 Events',
                      style: TextStyle(
                          fontFamily: "Roboto Bold",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  savedEvents(),
                  savedEvents(),
                  savedEvents(),
                ]))
          ],
        ));
  }
}
