import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService({this.uid});
  final String uid;

  //events reference
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  //users reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  //create new user and update if needed
  Future createUser(
      String name, String email, String password, String about) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'pasword': password,
      'about': about,
    });
  }

  //add event to database
  Future addEvent(
      String eventCreator,
      String name,
      String date,
      String time,
      String building,
      String room,
      double lat,
      double long,
      String description) async {
    return await eventCollection.document(uid).setData({
      'eventCreator': eventCreator,
      'name': name,
      'date': date,
      'time': time,
      'building': building,
      'room': room,
      'latitude': lat,
      'longitude': long,
      'description': description,
    });
  }

  //get current events to display
  Future getCurrentEvents() async {
    List currEvents = [];

    try {
      await eventCollection.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          currEvents.add(element.data);
        });
      });
      return currEvents;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
