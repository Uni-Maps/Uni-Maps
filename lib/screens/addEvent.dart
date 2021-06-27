import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:winhacks/models/user.dart';
import 'package:winhacks/services/database.dart';

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

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String name;
  String date;
  String time;
  String room;
  String description;
  String location;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
            ),
            onChanged: (val) => setState(() => name = val),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              onChanged: (val) => setState(() => date = val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.date_range),
                labelText: 'Date',
              ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              onChanged: (val) => setState(() => time = val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.access_time),
                labelText: 'Time',
              ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              onChanged: (val) => setState(() => location = val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.location_on),
                labelText: 'Building',
              ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              onChanged: (val) => setState(() => room = val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.location_on),
                labelText: 'Room',
              ))),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
              onChanged: (val) => setState(() => description = val),
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
        onPressed: () async {
          await DatabaseService().addEvent(
              user.uid,
              name,
              date,
              time,
              location,
              room,
              locations[location][0],
              locations[location][1],
              description);
          Navigator.pop(context);
        },
      ))
    ])));
  }
}
