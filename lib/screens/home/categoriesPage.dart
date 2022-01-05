import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/models/models.dart';

class CategoriesPage extends StatefulWidget {
  final Function toggleView;
  CategoriesPage({this.toggleView});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
                      'Browse by Category',
                      style: TextStyle(
                          fontFamily: "Roboto Bold",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),

                  // Categories
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          categories("Fitness"),
                          categories("Category")
                        ],
                      ),
                      Row(
                        children: [
                          categories("Fitness"),
                          categories("Category")
                        ],
                      ),
                      Row(
                        children: [
                          categories("Fitness"),
                          categories("Category")
                        ],
                      ),
                      Row(
                        children: [
                          categories("Fitness"),
                          categories("Category")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
