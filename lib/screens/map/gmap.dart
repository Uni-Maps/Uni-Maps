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

    // // Used to query current events
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    // print(date);
  }

  // // Figure out with permissions
  // // Maybe only ask for permission and use the default button to animate to current location
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
