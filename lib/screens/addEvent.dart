import 'package:flutter/material.dart';
import 'package:winhacks/screens/home_screen.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Stack(
        children: [
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage("assets/images/top_header.png"))),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.22,
              90,
              size.width * 0.1,
              30,
            ),
            child: Text('Add Event',
                style: TextStyle(
                    fontFamily: 'Montserrat Medium',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.grey[300]),
                textAlign: TextAlign.center),
          ),
        ],
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.event),
            labelText: 'Event Name',
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.date_range),
            labelText: 'Date',
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.access_time),
            labelText: 'Time',
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.location_on),
            labelText: 'Building',
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.location_on),
            labelText: 'Room',
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.description),
            labelText: 'Description',
          ))),
      Center(
          child: RaisedButton(
        color: Colors.blue[400],
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          'Create Event',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ))
    ])));
  }
}
