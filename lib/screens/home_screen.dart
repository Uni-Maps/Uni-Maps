import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:winhacks/screens/addEvent.dart';

import 'gmap.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage("assets/images/top_header.png"))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 175),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 40, // Centering the buttons
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton.icon(
                                  onPressed: () {
                                    print('Action event Line 42');
                                  },
                                  icon: Icon(Icons.local_activity, size: 100),
                                  color: Colors.blue,
                                  label: Text('Find a School',
                                      style: TextStyle(
                                          fontFamily: "Montserrat Medium",
                                          color: Colors.white,
                                          fontSize: 20)),
                                ),
                              ])
                        ])),
              ]),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 350),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 30, // Centering the buttons
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GMap()));
                                  },
                                  icon: Icon(Icons.local_activity, size: 100),
                                  color: Colors.blue,
                                  label: Text('Events near me',
                                      style: TextStyle(
                                          fontFamily: "Montserrat Medium",
                                          color: Colors.white,
                                          fontSize: 20)),
                                ),
                              ])
                        ])),
              ]),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 525),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 32, // Centering the buttons
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddEvent()));
                                  },
                                  icon: Icon(Icons.edit, size: 100),
                                  color: Colors.blue,
                                  label: Text('Create an Event',
                                      style: TextStyle(
                                          fontFamily: "Montserrat Medium",
                                          color: Colors.white,
                                          fontSize: 20)),
                                ),
                              ])
                        ])),
              ]),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                'https://mpng.subpng.com/20180630/asj/kisspng-computer-icons-download-avatar-5b3848b5343f86.741661901530415285214.jpg'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Edmund Lui',
                                    style: TextStyle(
                                        fontFamily: "Montserrat Medium",
                                        color: Colors.white,
                                        fontSize: 20)),
                                Text('Wilfrid Laurier University',
                                    style: TextStyle(
                                        fontFamily: "Montserrat Medium",
                                        color: Colors.white,
                                        fontSize: 14)),
                              ])
                        ])),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
