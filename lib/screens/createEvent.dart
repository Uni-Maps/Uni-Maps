// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:winhacks/models/user.dart';
import 'package:winhacks/models/models.dart';
import 'package:winhacks/services/database.dart';

// Location Drop down Variables
List locationItem = [
  "Athletic Complex",
  "Alumni hall",
  "John Aird Centre",
  "Bricker Academic Building",
  "Arts",
  "Career Centre",
  "Dr. Alvin Woods Building",
  "Dining Hall",
  "Fred Nichols Campus Centre",
  "Lazaridis Hall",
  "Martin Luther University College",
  "Science Building",
  "Frank C. Peters Building",
  "Paul Martin Centre",
  "Schlegel building",
];

// List of coordinates for locations
Map<String, List<double>> locations = {
  "Athletic Complex": [43.4752126803426, -80.52565140859437],
  "Alumni hall": [43.47298689536837, -80.52843465805189],
  "John Aird Centre": [43.4744298195108, -80.52822392085788],
  "Bricker Academic Building": [43.47271767912157, -80.52650914819121],
  "Arts": [43.47395449251259, -80.52939711505255],
  "Career Centre": [43.473962974582854, -80.52428699478007],
  "Dr. Alvin Woods Building": [43.47333433383295, -80.52951804984667],
  "Dining Hall": [43.474317344058605, -80.52865752351649],
  "Fred Nichols Campus Centre": [43.47330507679226, -80.52876233841724],
  "Lazaridis Hall": [43.47509607968329, -80.52945601978989],
  "Martin Luther University College": [43.471931677814105, -80.5287371368633],
  "Science Building": [43.473276933715916, -80.52516355453936],
  "Frank C. Peters Building": [43.47370370306412, -80.53038475509386],
  "Paul Martin Centre": [43.47417303304065, -80.52882452180214],
  "Schlegel building": [43.47325522257778, -80.53038099685122],
};

// Category Drop down Variables
String chooseCategory;
List categoryItem = [
  'Health and Wellness',
  'Career & Business',
  'Arts',
  'Tech',
  'Music',
  'Learning',
  'Social',
  'Foods & Drink',
];

TimeOfDay selectedTime = TimeOfDay.now();

class CreateEvents extends StatefulWidget {
  final Function toggleViewLogin;

  CreateEvents({this.toggleViewLogin});

  @override
  _CreateEventsState createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {
  TextEditingController timeinput = TextEditingController();

  String name;
  String date;
  String time;
  String room;
  String description;
  String location;
  String title = 'Create Event';

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    double screenWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            // Top App Bar Model
            topAppBar(title, screenWidth),

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
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: Column(
                      children: <Widget>[
                        // Event Name Input Box
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
                              onChanged: (val) => setState(() => name = val),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
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
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
                              onChanged: (val) =>
                                  setState(() => description = val),
                              keyboardType: TextInputType.multiline,
                              minLines:
                                  1, //Normal textInputField will be displayed
                              maxLines: 5,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  labelText: 'Event Description',
                                  labelStyle: TextStyle(color: Colors.white)),
                            )),

                        // Date

                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: DateTimePicker(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                labelText: 'Date',
                                labelStyle: TextStyle(color: Colors.white)),
                            initialValue: DateTime.now().toString(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            onChanged: (val) =>
                                setState(() => date = val.toString()),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                        ),

                        //Time
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Center(
                                child: TextField(
                              controller:
                                  timeinput, //editing controller of this TextField
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  // icon: Icon(Icons.timer), //icon of text field
                                  labelText: "Time", //label text of field
                                  enabledBorder: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  labelStyle: TextStyle(color: Colors.white)),

                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(pickedTime
                                      .format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm().parse(
                                      pickedTime.format(context).toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                      DateFormat('HH:mm').format(parsedTime);
                                  print(formattedTime); //output 14:59
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    timeinput.text =
                                        formattedTime; //set the value of text field.
                                    time = pickedTime.format(context);
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                            ))),

                        // Location Drop Down

                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Container(
                            decoration: new BoxDecoration(
                                color: Color(0xff493157),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(14.0),
                                    bottomLeft: const Radius.circular(14.0),
                                    bottomRight: const Radius.circular(14.0),
                                    topRight: const Radius.circular(14.0))),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: DropdownButton(
                                focusColor: Colors.white,
                                value: location,
                                elevation: 5,
                                isExpanded: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "Lato Regular"),
                                iconEnabledColor: Colors.white,
                                items: locationItem.map((valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem,
                                      child: (Text(valueItem)));
                                }).toList(),
                                hint: Text(
                                  "Choose Location",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Lato Regular"),
                                ),
                                dropdownColor: Color(0xff5E4770),
                                onChanged: (val) {
                                  setState(() {
                                    location = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        // Category Drop Down

                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Container(
                            decoration: new BoxDecoration(
                                color: Color(0xff493157),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(14.0),
                                    bottomLeft: const Radius.circular(14.0),
                                    bottomRight: const Radius.circular(14.0),
                                    topRight: const Radius.circular(14.0))),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: DropdownButton(
                                focusColor: Colors.white,
                                value: chooseCategory,
                                elevation: 5,
                                isExpanded: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "Lato Regular"),
                                iconEnabledColor: Colors.white,
                                items: categoryItem.map((valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem,
                                      child: (Text(valueItem)));
                                }).toList(),
                                hint: Text(
                                  "Choose Category",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Lato Regular"),
                                ),
                                dropdownColor: Color(0xff5E4770),
                                onChanged: (newValue) {
                                  setState(() {
                                    chooseCategory = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        // Create Event button
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await DatabaseService().addEvent(
                                        user.uid,
                                        name,
                                        date,
                                        time,
                                        location,
                                        room ?? "add room box",
                                        locations[location][0],
                                        locations[location][1],
                                        description);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "       Create Event       ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black87),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              side: BorderSide(
                                                  color: Colors.white10)))),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ]))
        ]))));
  }
}
