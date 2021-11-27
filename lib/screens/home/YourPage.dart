import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winhacks/screens/addEvent.dart';
import 'package:winhacks/screens/createEvent.dart';

class YourPage extends StatefulWidget {
  final Function toggleView;
  YourPage({this.toggleView});

  @override
  _YourPage_State createState() => _YourPage_State();
}

class _YourPage_State extends State<YourPage> {
  List eventsList = [];
  List eventIDs = [];

  CollectionReference currEvents = Firestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: currEvents.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("no value");
          } else {
            for (var event in snapshot.data.documents) {
              eventsList.add(event);
              eventIDs.add(event.documentID);
            }
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
                          'Suggested for you',
                          style: TextStyle(
                              fontFamily: "Roboto Bold",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      )),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateEvents()));
                          }),

                      // Slider
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: 230.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3)),
                          items: [0, 1, 2, 3, 4].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              AddEvent())); //route to events page
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0)),
                                          // Slider colour
                                          color: Color(0xff493657)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Image(
                                                // Temporary image for the slider
                                                // Be careful since the image needs to be an exact size right now
                                                image: AssetImage(
                                                    'assets/images/pancake.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                eventsList[i]['name'],
                                                style: TextStyle(
                                                    fontFamily: "Lato Bold",
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 4),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.white,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(4, 0, 0, 0),
                                                    child: Text(
                                                      eventsList[i]['date'],
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Lato Bold",
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 4),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(4, 0, 0, 0),
                                                    child: Text(
                                                      eventsList[i]['time'],
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Lato Bold",
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ));
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
                                    image:
                                        AssetImage('assets/images/pancake.png'),
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
        });
  }
}
