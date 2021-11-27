import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  final Function toggleViewLogin;
  ForgotPassword({this.toggleViewLogin});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String error = '';

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(

        // Add members in here
        resizeToAvoidBottomInset: false,
        // Stacks the members so that everything else appears above the background
        body: Container(
            child: Form(
                key: _formKey,
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

                  // Back button
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 45, 15, 0),
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
                    ),
                  ),
                  // Uni-Maps Title
                  SafeArea(
                      // Padding makes it so that is an invisible barrier
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                                        text: "Forgot your password?",
                                        style: TextStyle(
                                            fontFamily: "Lato Bold",
                                            color: Colors.white,
                                            fontSize: 30))
                                  ]),
                                ),

                                // Adding in the image for the email
                                Expanded(
                                    // Flex is used to expand compared to the other flexes (3x bigger than the other one)
                                    flex: 7,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Image.asset(
                                        "assets/images/people/email.png",
                                      ),
                                    )),

                                // Heading
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "Enter the email address associated",
                                        style: TextStyle(
                                            fontFamily: "Lato Bold",
                                            color: Colors.white,
                                            fontSize: 20)),
                                  ]),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "with your account.",
                                        style: TextStyle(
                                            fontFamily: "Lato Bold",
                                            color: Colors.white,
                                            fontSize: 20))
                                  ]),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 20, 40, 20),
                                    child: TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                            labelText: 'Email',
                                            labelStyle:
                                                TextStyle(color: Colors.white)),
                                        validator: (val) => val.isEmpty
                                            ? 'Enter an email'
                                            : null,
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        })),
                                // We will email you the link text
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: RichText(
                                    // textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "We will email you the link to",
                                          style: TextStyle(
                                              fontFamily: "Lato Regular",
                                              color: Colors.white54,
                                              fontSize: 16))
                                    ]),
                                  ),
                                ),
                                RichText(
                                  // textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "reset your password.",
                                        style: TextStyle(
                                            fontFamily: "Lato Regular",
                                            color: Colors.white54,
                                            fontSize: 16))
                                  ]),
                                ),
                                // Add in buttons/labels/texts between the title and the image at the bottom
                                // Username

                                //Login Button
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 60),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Line 180");
                                          _auth.sendPasswordResetEmail(
                                              email: email);
                                        },
                                        child: Text(
                                          "            Send Instructions            ",
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
                                                    borderRadius: BorderRadius.circular(
                                                        18),
                                                    side: BorderSide(
                                                        color: Colors.white10)))),
                                      )
                                    ],
                                  ),
                                ),

                                // Log In button and text
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff493657)),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              // In case any padding is ever needed
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Container(
                                                  child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "Don’t have an account?",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Lato Regular",
                                                          color: Colors.white54,
                                                          fontSize: 16)),
                                                ]),
                                              )),
                                            ), //Text button
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Color(0xff2EDEA6),
                                                textStyle: TextStyle(
                                                    fontSize: 17.5,
                                                    color: Colors.white,
                                                    fontFamily: "Lato Bold"),
                                              ),
                                              onPressed: () {
                                                print("Line 271");
                                                widget.toggleViewLogin();
                                              },
                                              child: Text('Register'),
                                            ),
                                          ])),
                                )
                              ]))))
                ]))));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
