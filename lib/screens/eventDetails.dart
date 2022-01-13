import 'package:flutter/material.dart';
import 'package:winhacks/models/models.dart';

class EventDetailsPage extends StatefulWidget {
  final Function toggleView;
  EventDetailsPage({this.toggleView});

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = 'Event Details';

    return Scaffold(
        body: Stack(children: <Widget>[
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            topAppBar(title, screenWidth),
            Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                // Outer container that is purple
                child: Container(
                  width: screenWidth - 20,
                  height: screenHeight / 2,
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
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: Column(
                      children: <Widget>[
                        RichText(text: TextSpan(text: "Hello world 2")),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            // Event Description
                            child: Container(
                              height: screenHeight / 3,
                              width: screenWidth - 40,
                              child:
                                  RichText(text: TextSpan(text: "Hello World")),
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0)),
                                  border: Border.all(color: Colors.white)),
                            )),
                      ],
                    ),
                  ),
                ))
          ]))
    ]));
  }
}
