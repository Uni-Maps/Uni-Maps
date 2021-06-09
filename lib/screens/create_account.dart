import 'package:flutter/material.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';

class Create_Account extends StatefulWidget {
  final Function toggleView;
  Create_Account({this.toggleView});

  @override
  _Create_AccountState createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String username = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        // Add members in here

        // Stacks the members so that everything else appears above the background
        body: Stack(children: <Widget>[
      // Stretches the widget to the entire screen is what Expanded does

      Expanded(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  // Background Image
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
        ),
      ),
      // Uni-Maps Title
      Expanded(
          // Creating a container so that the width can fill the entire screen
          child: Padding(
              // Padding makes it so that is an invisible barrier
              padding: const EdgeInsets.fromLTRB(10, 65, 10, 20),
              child: Container(
                  // Making width fit the screen depending on the screen size
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    // Rich Text has a lot of Text Spans which allow for different fonts/styles for each section of the text
                    RichText(
                      // Aligning text to be at the center
                      // textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Create Account",
                            style: TextStyle(
                                fontFamily: "Lato Bold",
                                color: Colors.white,
                                fontSize: 30))
                      ]),
                    ),
                    // Heading
                    RichText(
                      // textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Join the community",
                            style: TextStyle(
                                fontFamily: "Lato Bold",
                                color: Colors.white54,
                                fontSize: 16))
                      ]),
                    ),
                    // Add in buttons/labels/texts between the title and the image at the bottom
                    // Username
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ))),
                    // Email
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ))),
                    // Password

                    // FIGURE OUT WHY THE BORDERS OF THE TEXTFIELD ARE BLACK AND NOT WHITE
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Password',
                        ))),

                    // Text for the terms and services
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "By creating an account, you agree with our Terms and Service & Privacy Policy",
                            style: TextStyle(
                                fontFamily: "Lato Bold",
                                color: Colors.white54,
                                fontSize: 16))
                      ]),
                    ),
                    // Adding in the image for the person
                    Image(
                        image: AssetImage(
                            "assets/images/people/create_account_person.png"))
                  ]))))
    ]));
  }
}
