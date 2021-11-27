import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/services/auth.dart';

class CreateAccount extends StatefulWidget {
  final Function toggleViewLogin;

  CreateAccount({this.toggleViewLogin});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                                            fontFamily: "Lato Regular",
                                            color: Colors.white54,
                                            fontSize: 16))
                                  ]),
                                ),
                                // Add in buttons/labels/texts between the title and the image at the bottom
                                // Username
                                Padding(
                                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          labelText: 'Username',
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                    )),
                                // Email
                                Padding(
                                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          labelText: 'Email',
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                      validator: (val) =>
                                          val.isEmpty ? 'Enter an email' : null,
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                    )),
                                // Password

                                // FIGURE OUT WHY THE BORDERS OF THE TEXTFIELD ARE BLACK AND NOT WHITE
                                Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 20, 40, 20),
                                    child: TextFormField(
                                      obscureText: isHiddenPassword,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(14),
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
                                              TextStyle(color: Colors.white)),
                                      validator: (val) => val.length < 6
                                          ? 'Enter a password 6+ chars long'
                                          : null,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                    )),
                                // Button
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            dynamic result = await _auth
                                                .registerWithEmailandPassword(
                                                    email, password);
                                            if (result == null) {
                                              setState(() => error =
                                                  'Please enter a valid email');
                                            }
                                          }
                                        },
                                        child: Text(
                                          "               Sign Up               ",
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

                                // Text for the terms and services
                                Container(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(25, 20, 25, 0),
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "By creating an account, you agree with our Terms and Service & Privacy Policy",
                                                style: TextStyle(
                                                    fontFamily: "Lato Regular",
                                                    color: Colors.white54,
                                                    fontSize: 14))
                                          ]),
                                        ),
                                      )
                                    ])),
                                // Adding in the image for the person
                                Expanded(
                                    // Flex is used to expand compared to the other flexes (3x bigger than the other one)
                                    flex: 10,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                                      child: Image.asset(
                                          "assets/images/people/create_account_person.png",
                                          fit: BoxFit.fill),
                                    )),

                                // Log In button and text
                                Expanded(
                                  flex: 3,
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
                                                          "Already have an account?",
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
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontFamily: "Lato Bold"),
                                              ),
                                              onPressed: () {
                                                print("Line 271");
                                                widget.toggleViewLogin();
                                              },
                                              child: Text('Log In'),
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
