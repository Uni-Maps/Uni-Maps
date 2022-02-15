import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Categories model
categories(name) {
  return (Padding(
    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
    child: Container(
      width: 150,
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        // Slider colour
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Gesture Detection goes here

            Container(
              width: 150,
              height: 100,
              child: Image(
                // Temporary image for the slider
                // Be careful since the image needs to be an exact size right now
                image: AssetImage('assets/images/pancake.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: RichText(
                  text: TextSpan(text: name, style: TextStyle(fontSize: 16))),
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
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
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
        // Add 3 columns of equal sizing and put the title in the middle
        Column(children: <Widget>[
          Container(
              // Changing the screen width
              width: screenWidth / 3,
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
              ))
        ]),

        Column(children: <Widget>[
          Container(
              // Changing the screen width
              width: screenWidth / 3,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: title,
                      style: TextStyle(
                          fontFamily: "Lato Bold",
                          color: Colors.white,
                          fontSize: 25))
                ]),
              ))
        ]),
        Column(children: <Widget>[
          Container(
              // Changing the screen width
              width: screenWidth / 3)
        ]),
      ]));
}

// Top App Bar no back button
topAppBarEmpty(String title, double screenWidth) {
  return Container(
      height: 105,
      // Add padding
      decoration: new BoxDecoration(
        color: Color(0xff493657),
      ),
      child: Row(children: <Widget>[
        // Add 3 columns of equal sizing and put the title in the middle
        Column(children: <Widget>[
          Container(
            // Changing the screen width
            width: screenWidth / 3,
          )
        ]),

        Column(children: <Widget>[
          Container(
              // Changing the screen width
              width: screenWidth / 3,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: title,
                      style: TextStyle(
                          fontFamily: "Lato Bold",
                          color: Colors.white,
                          fontSize: 25))
                ]),
              ))
        ]),
        Column(children: <Widget>[
          Container(
              // Changing the screen width
              width: screenWidth / 3)
        ]),
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

events() {
  return (Padding(
    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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

notifications() {
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
                        "Gaming Club",
                        style: TextStyle(
                            fontFamily: "Lato Bold",
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Container(
                      width: 232,
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                                "Update: We are now rescheduling our gaming club event to next wednesday!",
                                style: TextStyle(
                                    fontFamily: "Lato Regular",
                                    color: Colors.white,
                                    fontSize: 14)),
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
