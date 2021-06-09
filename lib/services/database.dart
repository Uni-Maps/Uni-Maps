import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DatabaseService {
  DatabaseService({this.uid});
  final String uid;

  //events reference
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  //users reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future createUser(
      String name, String email, String password, String about) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'pasword': password,
      'about': about,
    });
  }

  Future addEvent(String eventCreator, String name, String date, String time,
      String building, String room, LatLng location, String description) async {
    return await eventCollection.document(uid).setData({
      'eventCreator': eventCreator,
      'name': name,
      'date': date,
      'time': time,
      'building': building,
      'room': room,
      'location': location,
      'description': description,
    });
  }
}
