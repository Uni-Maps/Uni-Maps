import 'package:flutter/material.dart';

import 'createAccount.dart';
import 'forgotPassword.dart';
import 'logIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

enum FormMode { LOGIN, SIGNUP, FORGOTPASSWORD }

class _AuthenticateState extends State<Authenticate> {
  var form = FormMode.LOGIN;

  void toggleViewLogin() {
    setState(() => form = FormMode.LOGIN);
  }

  void toggleViewSignup() {
    setState(() => form = FormMode.SIGNUP);
  }

  void toggleViewForgotPassword() {
    setState(() => form = FormMode.FORGOTPASSWORD);
  }

  @override
  Widget build(BuildContext context) {
    if (form == FormMode.LOGIN) {
      return SignIn(
          toggleViewSignup: toggleViewSignup,
          toggleViewForgotPassword: toggleViewForgotPassword);
    } else if (form == FormMode.SIGNUP) {
      return CreateAccount(toggleViewLogin: toggleViewLogin);
    } else {
      return ForgotPassword(toggleViewLogin: toggleViewLogin);
    }
  }
}
