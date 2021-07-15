import 'package:winhacks/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:winhacks/screens/authenticate/register.dart';

import '../create_account.dart';
import '../forgot_password.dart';
import '../log_in.dart';

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
      return SignIn_Account(
          toggleViewSignup: toggleViewSignup,
          toggleViewForgotPassword: toggleViewForgotPassword);
    } else if (form == FormMode.SIGNUP) {
      return Create_Account(toggleViewLogin: toggleViewLogin);
    } else {
      return Forgot_Password(toggleViewLogin: toggleViewLogin);
    }
  }
}
