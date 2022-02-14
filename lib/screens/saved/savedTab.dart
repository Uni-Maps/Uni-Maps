import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/screens/home/categoriesPage.dart';
import 'package:winhacks/screens/home/organizersPage.dart';
import 'package:winhacks/screens/home/YourPage.dart';
import 'package:winhacks/screens/notifications.dart';
import 'package:winhacks/services/auth.dart';
import 'package:winhacks/screens/createEvent.dart';
import 'package:winhacks/screens/saved/savedPage.dart';
import 'package:winhacks/screens/saved/interestedPage.dart';
import 'package:winhacks/screens/saved/pastPage.dart';

final recentEvents = [
  "hi",
  "there",
  "how",
  "are",
  "you",
];

final events = [
  "hi",
  "there",
  "how",
  "are",
  "you",
  "today",
  "because",
  "im ",
  "greatttttt",
];

class UserPage extends StatefulWidget {
  final Function toggleView;
  UserPage({this.toggleView});

  @override
  _SavedTabState createState() => _SavedTabState();
}

class _SavedTabState extends State<SavedTab> {
  final AuthService _auth = AuthService();

  bool isSearching = false;

  @override
  Widget build(BuildContext context) => DefaultTabController(
    String title = 'Saved';
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Title("Saved"),
            elevation: 0,
            
            actions: <Widget>[
              // Buttons go here
            ],
            backgroundColor: Color(0xff493657),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Upcoming Events'),
                Tab(text: 'Interested'),
                Tab(text: 'Past Events'),
              ],
            )),
        body: TabBarView(
          children: [
            // Replace with the appropriate page
            SavedPage(),
            PastPage(),
            InterestedPage(),
          ],
        ),
      ));
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? recentEvents
        : events.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            print(suggestionList[index]);
          },
          leading: Icon(Icons.event),
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]))),
      itemCount: suggestionList.length,
    );
  }
}
