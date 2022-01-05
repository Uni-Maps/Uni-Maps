import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/models/models.dart';
import 'package:winhacks/screens/organizationDetails.dart';

class OrganizersPage extends StatefulWidget {
  final Function toggleView;
  OrganizersPage({this.toggleView});

  @override
  _OrganizersPageState createState() => _OrganizersPageState();
}

class _OrganizersPageState extends State<OrganizersPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Text(
                      'Who to follow',
                      style: TextStyle(
                          fontFamily: "Roboto Bold",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Follow the most popular organizers and get notified when they post events',
                        style: TextStyle(
                            fontFamily: "Roboto Regular",
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ),
                  ),

                  // Organizations
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  OrganizationDetails())); //route to events page
                        },
                        child: Row(
                          children: [organizers()],
                        ),
                      ),
                      Row(
                        children: [organizers()],
                      ),
                      Row(
                        children: [organizers()],
                      ),
                      Row(
                        children: [organizers()],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
