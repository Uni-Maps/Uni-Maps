import 'package:flutter/material.dart';
import 'package:winhacks/models/models.dart';

// Change this drop down later
List interestItem = [
  "Going to Event",
  "Saved",
  "No",
];

String interest;

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
        topAppBar(title, screenWidth),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            // Outer container that is purple
            child: Container(
              width: screenWidth - 20,
              // height: screenHeight / 1.5,
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
                padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Container(
                          width: screenWidth - 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                // Temporary image for the slider
                                // Be careful since the image needs to be an exact size right now
                                image: AssetImage('assets/images/pancake.png'),
                                fit: BoxFit.cover,
                              )
                            ],
                          )),
                    ),
                    /*
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                              // Event Description
                              child: Container(
                                height: 35,
                                width: screenWidth - 40,
                                child: RichText(text: TextSpan(text: "Location")),
                                decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(10.0),
                                        bottomLeft: const Radius.circular(10.0),
                                        bottomRight: const Radius.circular(10.0),
                                        topRight: const Radius.circular(10.0)),
                                    border: Border.all(color: Colors.white)),
                              ))*/
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontFamily: "Lato Bold",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Description goes here
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Flexible(
                              child: Text(
                                'Welcome to pancake monday, where there will be free pancakes!',
                                style: TextStyle(
                                    fontFamily: "Lato Regular",
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Going to Event number
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              '175 Other people are attending',
                              style: TextStyle(
                                  fontFamily: "Lato Bold",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Interested Drop Down
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Color(0xff493157),
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(14.0),
                                bottomLeft: const Radius.circular(14.0),
                                bottomRight: const Radius.circular(14.0),
                                topRight: const Radius.circular(14.0))),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: DropdownButton(
                            focusColor: Colors.white,
                            value: interest,
                            elevation: 5,
                            isExpanded: true,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: "Lato Regular"),
                            iconEnabledColor: Colors.white,
                            items: interestItem.map((valueItem) {
                              return DropdownMenuItem(
                                  value: valueItem, child: (Text(valueItem)));
                            }).toList(),
                            hint: Text(
                              "Interested?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Lato Regular"),
                            ),
                            dropdownColor: Color(0xff5E4770),
                            onChanged: (val) {
                              setState(() {
                                interest = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // Location
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Science Building',
                              style: TextStyle(
                                  fontFamily: "Lato Bold",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Date
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Date Y',
                              style: TextStyle(
                                  fontFamily: "Lato Bold",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Time
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Time X',
                              style: TextStyle(
                                  fontFamily: "Lato Bold",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Social Media
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.link_sharp,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              'Instagram Z',
                              style: TextStyle(
                                  fontFamily: "Lato Bold",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Save Button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: screenWidth / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Save",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black87),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.white10)))),
                      ),
                    ),
                    // Organization Details Button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: screenWidth / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Organization Details",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black87),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.white10)))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]))
    ]));
  }
}
