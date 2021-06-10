import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:winhacks/screens/create_account.dart';
import 'package:winhacks/screens/forgot_password.dart';
import 'package:winhacks/screens/sign_in.dart';
import 'package:winhacks/screens/home/home.dart';
import 'package:winhacks/screens/home_screen.dart';
import 'package:winhacks/screens/wrapper.dart';
import 'package:winhacks/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winhacks/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        //home: Wrapper(),
        home: Forgot_Password(),
      ),
    );
  }
}
