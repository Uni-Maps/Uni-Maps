import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:winhacks/screens/categories_page.dart';
import 'package:winhacks/screens/organizers_page.dart';
import 'package:winhacks/screens/YourPage.dart';
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
            // title: !isSearching
            //     ? Text('')
            //     : TextField(
            //         style: TextStyle(color: Colors.white),
            //         decoration: InputDecoration(
            //             hintText: "Search here",
            //             icon: Icon(
            //               Icons.search,
            //               color: Colors.white,
            //             ),
            //             hintStyle: TextStyle(color: Colors.white)),
            //       ),
            elevation: 0,
            // leading: !isSearching
            //     ? IconButton(
            //         icon: const Icon(Icons.person),
            //         onPressed: () {},
            //         iconSize: 35,
            //       )
            //     : null,
            leading: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
              iconSize: 35,
            ),
            // actions: !isSearching
            //     ? <Widget>[
            //         // Search bar
            //         IconButton(
            //           icon: const Icon(Icons.search),
            //           onPressed: () {
            //             setState(() {
            //               this.isSearching = !this.isSearching;
            //             });
            //           },
            //           iconSize: 35,
            //         ),
            //         IconButton(
            //           icon: const Icon(Icons.notifications),
            //           onPressed: () {},
            //           iconSize: 35,
            //         ),
            //         IconButton(
            //           icon: const Icon(Icons.logout),
            //           onPressed: () async {
            //             await _auth.signOut();
            //           },
            //         )
            //       ]
            //     : <Widget>[
            //         // Search bar
            //         IconButton(
            //           icon: const Icon(Icons.cancel),
            //           onPressed: () {
            //             setState(() {
            //               this.isSearching = !this.isSearching;
            //             });
            //           },
            //           iconSize: 35,
            //         ),
            //       ],
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
            Categories_Page(),
            Organizers_Page(),
          ],
        ),
      ));
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
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
    // TODO: implement buildLeading
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
    // TODO: implement buildResults
    // show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? recentEvents
        : events.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {},
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
