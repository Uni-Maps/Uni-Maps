import 'package:winhacks/screens/authenticate/authenticate.dart';
import 'package:winhacks/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winhacks/models/user.dart';
import 'package:winhacks/screens/navigation_bar.dart';
import 'package:winhacks/screens/user_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Navigation_Bar();
    }
  }
}
