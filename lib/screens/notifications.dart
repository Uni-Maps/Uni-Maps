import 'package:flutter/material.dart';
import 'package:winhacks/models/models.dart';

class NotificationPage extends StatefulWidget {
  final Function toggleView;
  NotificationPage({this.toggleView});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = 'Notifications';

    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  // Background Image
                  image: AssetImage("assets/images/blank_background.png"),
                  fit: BoxFit.fill)),
        ),
      ),
      Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            topAppBar(title, screenWidth),
            notifications(),
            notifications()
          ]))
    ]));
  }
}
