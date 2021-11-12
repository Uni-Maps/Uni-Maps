import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:winhacks/screens/addEvent.dart';

class GMap extends StatefulWidget {
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();

  GoogleMapController mapController;
  final Location location = new Location();

  List currEventsList = [];
  List eventIDs = [];

  final LatLng _center = const LatLng(43.474864, -80.527977);

  // final Marker marker1 = Marker(
  //     markerId: MarkerId("0"),
  //     position: LatLng(43.47514096535828, -80.52958815123563),
  //     infoWindow: InfoWindow(
  //         title: "Microsoft Case Competition Finals 2021",
  //         snippet:
  //             "Microsoft is hosting a case competition based on emerging ..."));

  // final Marker marker2 = Marker(
  //     markerId: MarkerId("1"),
  //     position: LatLng(43.47471080798665, -80.52975981260784),
  //     infoWindow: InfoWindow(
  //         title: "BU121 SOS Session",
  //         snippet: "Come to the BU121 SOS session to ..."));

  // final Marker marker3 = Marker(
  //     markerId: MarkerId("2"),
  //     position: LatLng(43.47426499830714, -80.52868704497145),
  //     infoWindow: InfoWindow(
  //         title: "Pancake Monday",
  //         snippet:
  //             "Come to the auditorium for some free pancakes sponsored ..."));

  // final Marker marker4 = Marker(
  //     markerId: MarkerId("3"),
  //     position: LatLng(43.473358491122056, -80.52947108756365),
  //     infoWindow: InfoWindow(
  //         title: "The Advertising Project (TAP)",
  //         snippet: "Find out more abotu Enactus and what ..."));

  // final Marker marker5 = Marker(
  //     markerId: MarkerId("4"),
  //     position: LatLng(43.474567552666905, -80.52832337838474),
  //     infoWindow: InfoWindow(
  //         title: "Hamilton",
  //         snippet: "Laurier students will perform Hamilton led by ..."));

  // final Marker marker6 = Marker(
  //     markerId: MarkerId("5"),
  //     position: LatLng(43.47288503805051, -80.53006558444754),
  //     infoWindow: InfoWindow(
  //         title: "Dog Therapy Session",
  //         snippet:
  //             "Come to the library 4th floor to destress and pet some dogs!"));

  // final Marker marker7 = Marker(
  //     markerId: MarkerId("6"),
  //     position: LatLng(43.47329379500157, -80.52552798468979),
  //     infoWindow: InfoWindow(
  //         title: "Laurier Data Science Society Booth",
  //         snippet: "Learn more about data science and how ... !"));

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    for (int i = 0; i < currEventsList.length; i++) {
      final Marker marker = Marker(
        markerId: MarkerId(eventIDs[i]),
        position: LatLng(
            currEventsList[i]['latitude'], currEventsList[i]['longitude']),
        infoWindow: InfoWindow(
            title: currEventsList[i]['name'],
            snippet: currEventsList[i]['description'],
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddEvent()));
            }),
      );

      setState(() {
        _markers.add(marker);
      });
    }

    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    // print(date);
  }

  // //currently have this function... not sure why it didnt show before??
  // void _animateToUser() async {
  //   Location location = new Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationData = await location.getLocation();

  //   mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //     target: LatLng(_locationData.latitude, _locationData.longitude),
  //     zoom: 16.0,
  //   )));
  // }

  @override
  Widget build(BuildContext context) {
    CollectionReference currEvents = Firestore.instance.collection('events');

    return StreamBuilder(
        stream: currEvents.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("no value");
          } else {
            for (var event in snapshot.data.documents) {
              currEventsList.add(event);
              eventIDs.add(event.documentID);
            }
            print(currEvents);
            return Scaffold(
              appBar: AppBar(
                title: Text("Events"),
              ),
              body: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 16.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _markers,
              ),
              // floatingActionButton: FloatingActionButton(
              //     child: Icon(Icons.location_searching),
              //     onPressed: () {
              //       _animateToUser();
              //     }),
            );
          }
        });
  }
}
