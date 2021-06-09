import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  bool isHiddenPassword = true;

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
          // Uni-Maps Title
          SafeArea(

              // Padding makes it so that is an invisible barrier
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 65, 10, 20),
                  // Creating a container so that the width can fill the entire screen
                  child: Container(
                      // Making width fit the screen depending on the screen size
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(children: <Widget>[
                        // Rich Text has a lot of Text Spans which allow for different fonts/styles for each section of the text
                        RichText(
                          // Aligning text to be at the center
                          // textAlign: TextAlign.center,
                          // Add Text Spans to edit each section of the entire sentence
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    labelText: 'Username',
                                    labelStyle:
                                        TextStyle(color: Colors.white)))),
                        // Email
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    labelText: 'Email',
                                    labelStyle:
                                        TextStyle(color: Colors.white)))),
                        // Password

                        // FIGURE OUT WHY THE BORDERS OF THE TEXTFIELD ARE BLACK AND NOT WHITE
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                                obscureText: isHiddenPassword,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        Icons.visibility,
                                        color: this.isHiddenPassword
                                            ? Colors.grey
                                            : Colors.blue,
                                      ),
                                    ),
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: Colors.white)))),

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
                                "assets/images/people/create_account_person.png")),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    fontFamily: "Lato Bold",
                                    color: Colors.white,
                                    fontSize: 16)),
                            TextSpan(
                                text: "Log in",
                                style: TextStyle(
                                    fontFamily: "Lato Bold",
                                    color: Color(0xff2EDEA6),
                                    fontSize: 16))
                          ]),
                        ),
                      ]))))
        ]));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
