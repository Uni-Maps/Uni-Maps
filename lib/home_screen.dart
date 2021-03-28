import 'package:flutter/material.dart';

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
                    image: AssetImage('assets/images/top_header.png'))),
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
                                Text('First Name, Last Name',
                                    style: TextStyle(
                                        fontFamily: "Montserrat Medium",
                                        color: Colors.white,
                                        fontSize: 20)),
                                Text('Student ID',
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
