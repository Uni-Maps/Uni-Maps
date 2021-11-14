import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

//String _initialValue = '';
String _valueChanged1 = '';
String _valueToValidate1 = '';
String _valueSaved1 = '';
String _valueChanged2 = '';
String _valueToValidate2 = '';
String _valueSaved2 = '';
String _valueChanged3 = '';
String _valueToValidate3 = '';
String _valueSaved3 = '';
String _valueChanged4 = '';
String _valueToValidate4 = '';
String _valueSaved4 = '';

// Location Drop down Variables
String chooseValue;
List locationItem = [
  'Lazaridis',
  'Concourse',
];

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

class Create_Events extends StatefulWidget {
  final Function toggleViewLogin;

  Create_Events({this.toggleViewLogin});

  @override
  _Create_EventsState createState() => _Create_EventsState();
}

class _Create_EventsState extends State<Create_Events> {
  TextEditingController timeinput = TextEditingController();
  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: Column(
                      children: <Widget>[
                        // Event Name Input Box
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextFormField(
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
                            onChanged: (val) => print(val),
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
                                value: chooseValue,
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
                                onChanged: (newValue) {
                                  setState(() {
                                    chooseValue = newValue;
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
                                  onPressed: () {
                                    print("Line 367");
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
