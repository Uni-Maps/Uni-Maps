import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/screens/home/categoriesPage.dart';
import 'package:winhacks/screens/home/organizersPage.dart';
import 'package:winhacks/screens/home/YourPage.dart';
import 'package:winhacks/services/auth.dart';

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
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final AuthService _auth = AuthService();

  bool isSearching = false;

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
              iconSize: 35,
            ),
            actions: <Widget>[
              // Search bar
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                iconSize: 35,
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
                iconSize: 35,
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
            backgroundColor: Color(0xff493657),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Your Page'),
                Tab(text: 'Categories'),
                Tab(text: 'Organizations'),
              ],
            )),
        body: TabBarView(
          children: [
            YourPage(),
            CategoriesPage(),
            OrganizersPage(),
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
