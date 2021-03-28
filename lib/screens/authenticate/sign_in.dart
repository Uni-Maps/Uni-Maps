import 'package:flutter/material.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue[100],

      // appBar: AppBar(
      // backgroundColor: Colors.blue[400],
      // elevation: 0.0,
      // title: Text('Sign in to Uni-Maps'),
      // actions: <Widget>[
      //   FlatButton.icon(
      //       icon: Icon(Icons.person),
      //       label: Text('Register'),
      //       onPressed: () {
      //         widget.toggleView();
      //       }),
      // ],
      // ),

      body: Container(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: size.height * .3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image:
                                  AssetImage("assets/images/top_header.png"))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.32,
                        90,
                        size.width * 0.3,
                        30,
                      ),
                      child: Text('Uni-Map',
                          style: TextStyle(
                              fontFamily: 'Montserrat Medium',
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                              color: Colors.grey[300]),
                          textAlign: TextAlign.center),
                    )
                  ]),
                  SizedBox(height: 50.0),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          })),
                  SizedBox(height: 20.0),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          })),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .signInWithEmailandPassword(email, password);
                          if (result == null) {
                            setState(() => error =
                                'Could not sign in with those credentials! Please enter a valid email.');
                          }
                        }
                      }),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  new GestureDetector(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: new Text("Dont have an account? Sign up here"),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

// class TopImageAsset extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage = AssetImage('assets/images/top_header.png');
//     Image image = Image(image: assetImage, width: 1000.0);
//     return Container(child: image);
//   }
// }
